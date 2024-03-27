
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `library_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_due_list` ()  NO SQL
SELECT I.issue_id, M.email, B.isbn, B.title
FROM book_issue_log I INNER JOIN member M on I.member = M.username INNER JOIN book B ON I.book_isbn = B.isbn
WHERE DATEDIFF(CURRENT_DATE, I.due_date) >= 0 AND DATEDIFF(CURRENT_DATE, I.due_date) % 5 = 0 AND (I.last_reminded IS NULL OR DATEDIFF(I.last_reminded, CURRENT_DATE) <> 0)$$

DELIMITER ;

CREATE TABLE `book` (
  `isbn` char(13) NOT NULL,
  `title` varchar(80) NOT NULL,
  `author` varchar(80) NOT NULL,
  `category` varchar(80) NOT NULL,
  `credits` int(4) UNSIGNED NOT NULL,
  `copies` int(10) UNSIGNED NOT NULL,
  `links` varchar(255) NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `book` (`isbn`, `title`, `author`, `category`, `credits`, `copies`, `links`) VALUES
('0000545010225', 'Friction Free Parenting', 'Ramesh Rajini', 'Non-fiction', 500, 1, 'https://www.amazon.in/Friction-Free-Parenting-Practical-Burnouts-Preserve/dp/1636407463'),
('9783862486328', 'Rich Dad Poor Dad', 'Robert T. Kiyosaki', 'Finance', 500, 1, 'https://drive.google.com/file/d/1eOluRCm2Rowd1fpsW2yO986X-o5jz5KL/view?usp=sharing'),
('9788411480833', 'A Passage to India', 'E.M. Foster', 'Novel', 500, 1, 'https://drive.google.com/file/d/1zM8ji47PdfOw4HW7ozLRJDbk0gWgftVe/view?usp=sharing'),
('9780706904918', 'A Revenue Stamp', 'Amrita Pritam', 'autobiography', 500, 1, 'https://drive.google.com/file/d/1q-4w9pA00wZFeaB08KLX-OHXFANyu4Tr/view?usp=sharing'),
('9781455609734', 'See you at the top', 'Zig Ziglar', 'Non-Fiction', 500, 1, 'https://drive.google.com/file/d/19b17EcSD5LiWofhdTYkeICzq5ZyRqGsn/view?usp=sharing'),
('9780061122415', 'The Alchemist', 'Paulo Coelho', 'Novel', 500, 1, 'https://drive.google.com/file/d/151aIUu7kQ-Kj7fqOx8HeB8IQxPU-vFcn/view?usp=sharing'),
('9780735211292', 'Atomic Habits', 'James Clear', 'Non-Fiction', 500, 1, 'https://drive.google.com/file/d/1gFaKU1wz_-8_V2sz0L_8NSASxctfL1pr/view?usp=sharing'),
('9780141918921', 'Thinking Fast & Slow', 'Daniel Kahneman', 'Non-fiction', 500, 1, 'https://drive.google.com/file/d/199zjniwWXae2ucnsxq2f3GtAMXa35P1G/view?usp=sharing'),
('9780062911759', 'Best Self - be you, only better', 'Mike Bayer', 'Fiction', 500, 1, 'https://drive.google.com/file/d/1R792lTJ5SPQHho3KfcZQpE2bwrgzgn4c/view?usp=sharing'),
('9789391165499', 'Do Epic Shit', 'Ankur Warikoo', 'Eduction', 500, 1, 'https://drive.google.com/file/d/1w_rKJoKhvmOnbUJT30qqMAVRRyQvbtQj/view?usp=sharing'),
('9783644005365', 'Think Like A Monk', 'Jay Shetty', 'Eduction', 500, 1, 'https://drive.google.com/file/d/1W-OaMX0CDPRSV8yZoXGob8x8G3ZG3cFD/view?usp=sharing'),
('9780857197696', 'The Psychology Of Money', 'Morgan Housel', 'Fiction', 500, 1, 'https://drive.google.com/file/d/1ojG4QYTBLbftISUJbXIA9DLPkVa0wUnP/view?usp=sharing'),
('9780307268686', 'Unaccustomed Earth', 'Jhumpa Lahiri', 'Fiction', 500, 1, 'https://drive.google.com/file/d/1htKe4hMCfKg6gBv65QL-imZmizWTI6r8/view?usp=sharing'),
('9781608466542', 'The end of imagination', 'Arundhati Roy', 'Fiction', 500, 1, 'https://drive.google.com/file/d/1-05LAtywRfSIiBIExzU5lFpCSECecrzA/view?usp=sharing'),
('9789356291089', 'Girl in Room 105', 'Chetan Bhagat', 'Novel', 500, 1, 'https://drive.google.com/file/d/1FWisyn6UPYEIdOpMFhGZ5GeDmo8zjmUM/view?usp=sharing'),
('9789351860310', 'Five Point Someone', 'Chetan Bhagat', 'Novel', 500, 1, 'https://drive.google.com/file/d/13_Ir2MVEnYi5DD8FWKKLnFP5TeyJjfdd/view?usp=sharing'),
('9789356291492', 'One Arranged Murder', 'Chetan Bhagat', 'Novel', 500, 1, 'https://drive.google.com/file/d/1ox42CyMTK5kJBVOqsZboh39iw82Z8mOo/view?usp=sharing'),
('9789171497581', 'Bhagavad Gita-English version', 'A.C.Swami Prabhupada', 'Religious', 500, 1, 'https://drive.google.com/file/d/1BNu4BcMNobj1poQmjCuqIMISEynFKr-h/view?usp=sharing'),
('9780719568893', 'River of Smoke', 'Amitav Ghosh', 'Fiction', 500, 1, 'https://drive.google.com/file/d/1f75m6WfWBYN63NtZPSD4hnkPmMAlnIbl/view?usp=sharing'),
('9789381626719', 'The Kite Runner', 'Khaled Hosseini', 'Novel', 500, 1, 'https://drive.google.com/file/d/1ofFiGQKctqjlfJgz5GIrTvSF_m--Y9SV/view?usp=sharing');


CREATE TABLE `book_issue_log` (
  `issue_id` int(11) NOT NULL,
  `member` varchar(20) NOT NULL,
  `book_isbn` varchar(13) NOT NULL,
  `due_date` date NOT NULL,
  `last_reminded` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DELIMITER $$
CREATE TRIGGER `issue_book` BEFORE INSERT ON `book_issue_log` FOR EACH ROW BEGIN
	SET NEW.due_date = DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY);
    UPDATE member SET balance = balance - (SELECT credits FROM book WHERE isbn = NEW.book_isbn) WHERE username = NEW.member;
    UPDATE book SET copies = copies - 1 WHERE isbn = NEW.book_isbn;
    DELETE FROM pending_book_requests WHERE member = NEW.member AND book_isbn = NEW.book_isbn;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `return_book` BEFORE DELETE ON `book_issue_log` FOR EACH ROW BEGIN
    UPDATE member SET balance = balance + (SELECT credits FROM book WHERE isbn = OLD.book_isbn) WHERE username = OLD.member;
    UPDATE book SET copies = copies + 1 WHERE isbn = OLD.book_isbn;
END
$$
DELIMITER ;


CREATE TABLE `librarian` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `librarian` (`id`, `username`, `password`) VALUES
(1, 'nayan', '93c768d0152f72bc8d5e782c0b585acc35fb0442');


CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` char(40) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `balance` int(4) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `member` (`id`, `username`, `password`, `name`, `email`, `balance`, `time`) VALUES
(1, 'olduser', 'c67adbca4bd9f7e583f05f4c7edbcb733c7c9233', 'Old User', 'old@gmail.com', 1000, '2023-02-15 12:53:27');

DELIMITER $$
CREATE TRIGGER `add_member` AFTER INSERT ON `member` FOR EACH ROW DELETE FROM pending_registrations WHERE username = NEW.username
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `remove_member` AFTER DELETE ON `member` FOR EACH ROW DELETE FROM pending_book_requests WHERE member = OLD.username
$$
DELIMITER ;

CREATE TABLE `pending_book_requests` (
  `request_id` int(11) NOT NULL,
  `member` varchar(20) NOT NULL,
  `book_isbn` varchar(13) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `pending_book_requests` (`request_id`, `member`, `book_isbn`, `time`) VALUES
(1, 'olduser', '0000545010225', '2023-02-15 12:55:23');


CREATE TABLE `pending_registrations` (
  `username` varchar(20) NOT NULL,
  `password` char(40) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `balance` int(4) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `book`
  ADD PRIMARY KEY (`isbn`);


ALTER TABLE `book_issue_log`
  ADD PRIMARY KEY (`issue_id`);

ALTER TABLE `librarian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);


ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);


ALTER TABLE `pending_book_requests`
  ADD PRIMARY KEY (`request_id`);


ALTER TABLE `pending_registrations`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);


ALTER TABLE `book_issue_log`
  MODIFY `issue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `librarian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `pending_book_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

