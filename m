Return-Path: <MAILER-DAEMON>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B76BCA1008
	for <soc@archiver.kernel.org>; Tue,  5 Sep 2023 20:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C3D1C433CD; Tue,  5 Sep 2023 20:49:40 +0000 (UTC)
Received: from mail-skype.top (mail-skype.top [185.81.128.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35B50C433C9
	for <soc@kernel.org>; Tue,  5 Sep 2023 20:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35B50C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail-skype.top
Authentication-Results: smtp.kernel.org; spf=pass smtp.helo=mail-skype.top
Date: Tue, 5 Sep 2023 23:49:39 +0300
From: postmaster@mail-skype.top
Subject: Delivery report
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
MIME-Version: 1.0
Content-Type: multipart/report; report-type=delivery-status;
    boundary="report64F79463@mail-skype.top"
Message-Id: <20230905204939.35B50C433C9@smtp.kernel.org>


--report64F79463@mail-skype.top
Content-Type: text/plain

Hello, this is the mail server on mail-skype.top.

I am sending you this message to inform you on the delivery status of a
message you previously sent.  Immediately below you will find a list of
the affected recipients;  also attached is a Delivery Status Notification
(DSN) report in standard format, as well as the headers of the original
message.

  <soc@kernel.org>  delivery failed; will not continue trying

--report64F79463@mail-skype.top
Content-Type: message/delivery-status

Reporting-MTA: dns;mail-skype.top
X-PowerMTA-VirtualMTA: web1
Received-From-MTA: dns;kernel.org (193.42.32.239)
Arrival-Date: Tue, 5 Sep 2023 21:19:44 +0300

Final-Recipient: rfc822;soc@kernel.org
Action: failed
Status: 5.7.1 (delivery not authorized)
Remote-MTA: dns;smtp1.kernel.org (35.83.38.47)
Diagnostic-Code: smtp;550 5.7.1 Blocked by SpamAssassin
X-PowerMTA-BounceCategory: spam-related

--report64F79463@mail-skype.top
Content-Type: text/rfc822-headers

From: kernel.org <soc@kernel.org>
To: soc@kernel.org
Subject: soc@kernel.org  Password Notification
Date: 05 Sep 2023 20:18:40 +0200
Message-ID: <20230905201840.39BE6A456B5D8F4F@kernel.org>
MIME-Version: 1.0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

--report64F79463@mail-skype.top--
