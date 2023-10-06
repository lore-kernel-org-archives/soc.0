Return-Path: <MAILER-DAEMON>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48618E81DE9
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 12:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A89FC433C9; Fri,  6 Oct 2023 12:50:56 +0000 (UTC)
Received: from a-match.info (a-match.info [106.75.66.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60312C433C7
	for <soc@kernel.org>; Fri,  6 Oct 2023 12:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60312C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=a-match.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.helo=a-match.info
Date: Fri, 6 Oct 2023 20:50:54 +0800
From: postmaster@a-match.info
Subject: Delivery report
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
MIME-Version: 1.0
Content-Type: multipart/report; report-type=delivery-status;
    boundary="report652002AE@a-match.info"
Message-Id: <20231006125054.60312C433C7@smtp.kernel.org>


--report652002AE@a-match.info
Content-Type: text/plain

Hello, this is the mail server on a-match.info.

I am sending you this message to inform you on the delivery status of a
message you previously sent.  Immediately below you will find a list of
the affected recipients;  also attached is a Delivery Status Notification
(DSN) report in standard format, as well as the headers of the original
message.

  <soc@kernel.org>  delivery failed; will not continue trying

--report652002AE@a-match.info
Content-Type: message/delivery-status

Reporting-MTA: dns;a-match.info
X-PowerMTA-VirtualMTA: web1
Received-From-MTA: dns;kernel.org (107.161.81.159)
Arrival-Date: Fri, 6 Oct 2023 20:50:47 +0800

Final-Recipient: rfc822;soc@kernel.org
Action: failed
Status: 5.7.1 (delivery not authorized)
Remote-MTA: dns;smtp1.kernel.org (35.83.38.47)
Diagnostic-Code: smtp;550 5.7.1 Blocked by SpamAssassin
X-PowerMTA-BounceCategory: spam-related

--report652002AE@a-match.info
Content-Type: text/rfc822-headers

From: kernel.org < soc@kernel.org >
To: soc@kernel.org
Subject: Update your mail client to avoid loss of files or email Header: IT Admin Helpdesk
Date: 06 Oct 2023 05:49:41 -0700
Message-ID: <20231006054941.96BF9ABBE8F65920@kernel.org>
MIME-Version: 1.0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

--report652002AE@a-match.info--
