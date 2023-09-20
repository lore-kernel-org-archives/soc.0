Return-Path: <MAILER-DAEMON>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9419FCE79A9
	for <soc@archiver.kernel.org>; Wed, 20 Sep 2023 03:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D672C433C7; Wed, 20 Sep 2023 03:28:56 +0000 (UTC)
Received: from mail-mark.top (mail-mark.top [106.75.93.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DBE4C433C8
	for <soc@kernel.org>; Wed, 20 Sep 2023 03:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5DBE4C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail-mark.top
Authentication-Results: smtp.kernel.org; spf=pass smtp.helo=mail-mark.top
Date: Wed, 20 Sep 2023 11:28:55 +0800
From: postmaster@mail-mark.top
Subject: Delivery report
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
MIME-Version: 1.0
Content-Type: multipart/report; report-type=delivery-status;
    boundary="report650A66F7@mail-mark.top"
Message-Id: <20230920032855.5DBE4C433C8@smtp.kernel.org>


--report650A66F7@mail-mark.top
Content-Type: text/plain

Hello, this is the mail server on mail-mark.top.

I am sending you this message to inform you on the delivery status of a
message you previously sent.  Immediately below you will find a list of
the affected recipients;  also attached is a Delivery Status Notification
(DSN) report in standard format, as well as the headers of the original
message.

  <soc@kernel.org>  delivery failed; will not continue trying

--report650A66F7@mail-mark.top
Content-Type: message/delivery-status

Reporting-MTA: dns;mail-mark.top
X-PowerMTA-VirtualMTA: web1
Received-From-MTA: dns;kernel.org (193.42.32.239)
Arrival-Date: Wed, 20 Sep 2023 11:28:48 +0800

Final-Recipient: rfc822;soc@kernel.org
Action: failed
Status: 5.7.1 (delivery not authorized)
Remote-MTA: dns;smtp2.kernel.org (35.85.114.177)
Diagnostic-Code: smtp;550 5.7.1 Blocked by SpamAssassin
X-PowerMTA-BounceCategory: spam-related

--report650A66F7@mail-mark.top
Content-Type: text/rfc822-headers

From: WeTransfer<soc@kernel.org>
To: soc@kernel.org
Subject: Files Sent Via Wetransfer To soc@kernel.org
Date: 20 Sep 2023 05:27:42 +0200
Message-ID: <20230920052742.EAAFBAFBC76E9A71@kernel.org>
MIME-Version: 1.0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

--report650A66F7@mail-mark.top--
