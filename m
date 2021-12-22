Return-Path: <MAILER-DAEMON>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9E6C433F5
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 08:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E51DC36AEA; Wed, 22 Dec 2021 08:15:55 +0000 (UTC)
Received: from natalya.videolan.org (natalya.videolan.org [213.36.253.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E78BFC36AE8
	for <soc@kernel.org>; Wed, 22 Dec 2021 08:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E78BFC36AE8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=natalya.videolan.org
Authentication-Results: smtp.kernel.org; spf=none smtp.helo=natalya.videolan.org
Received: from localhost (localhost [127.0.0.1])
	by natalya.videolan.org (Postfix) with ESMTP id 0D5FB410CEF
	for <soc@kernel.org>; Wed, 22 Dec 2021 05:48:44 +0000 (UTC)
Content-Type: multipart/report; report-type=delivery-status;
 boundary="----------=_1640152124-758-1"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: BANNED contents from you (.exe,.exe-ms,attachment.htm ... .pif)
Message-ID: <VSsyinIoIY9ogE@natalya.videolan.org>
From: "Content-filter at natalya.videolan.org" <postmaster@natalya.videolan.org>
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>
Date: Wed, 22 Dec 2021 05:48:43 +0000 (UTC)

This is a multi-part message in MIME format...

------------=_1640152124-758-1
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

BANNED CONTENTS ALERT

Our content checker found
    banned name: .exe,.exe-ms,attachment.htm ... .pif

in email presumably from you <soc@kernel.org>
to the following recipient:
-> libdvbpsi-devel@videolan.org

Our internal reference code for your message is 00758-19/syinIoIY9ogE

First upstream SMTP client IP address: [123.118.73.138] 
According to a 'Received:' trace, the message apparently originated at:
  [123.118.73.138], kernel.org unknown [123.118.73.138]

Return-Path: <soc@kernel.org>
From: soc@kernel.org
Subject: Message could not be delivered

Delivery of the email was stopped!

The message has been blocked because it contains a component
(as a MIME part or nested within) with declared name
or MIME type or contents type violating our access policy.

To transfer contents that may be considered risky or unwanted
by site policies, or simply too large for mailing, please consider
publishing your content on the web, and only sending an URL of the
document to the recipient.

Depending on the recipient and sender site policies, with a little
effort it might still be possible to send any contents (including
viruses) using one of the following methods:

- encrypted using pgp, gpg or other encryption methods;

- wrapped in a password-protected or scrambled container or archive
  (e.g.: zip -e, arj -g, arc g, rar -p, or other methods)

Note that if the contents is not intended to be secret, the
encryption key or password may be included in the same message
for recipient's convenience.

We are sorry for inconvenience if the contents was not malicious.

The purpose of these restrictions is to cut the most common propagation
methods used by viruses and other malware. These often exploit automatic
mechanisms and security holes in more popular mail readers (Microsoft
mail readers and browsers are a common target). By requiring an explicit
and decisive action from the recipient to decode mail, the danger of
automatic malware propagation is largely reduced.


------------=_1640152124-758-1
Content-Type: message/delivery-status; name="dsn_status.dsn"
Content-Disposition: inline; filename="dsn_status.dsn"
Content-Transfer-Encoding: 7bit
Content-Description: Delivery error report

Reporting-MTA: dns; natalya.videolan.org
Received-From-MTA: dns; natalya.videolan.org ([127.0.0.1])
Arrival-Date: Wed, 22 Dec 2021 05:48:43 +0000 (UTC)

Original-Recipient: rfc822;libdvbpsi-devel@videolan.org
Final-Recipient: rfc822;libdvbpsi-devel@videolan.org
Action: failed
Status: 5.7.0
Diagnostic-Code: smtp; 554-5.7.0 Bounce, id=00758-19 - BANNED:
 554 5.7.0 .exe,.exe-ms,attachment.htm ... .pif
Last-Attempt-Date: Wed, 22 Dec 2021 05:48:43 +0000 (UTC)
Final-Log-ID: 00758-19/syinIoIY9ogE

------------=_1640152124-758-1
Content-Type: text/rfc822-headers; name="header.hdr"
Content-Disposition: inline; filename="header.hdr"
Content-Transfer-Encoding: 7bit
Content-Description: Message header section

Return-Path: <soc@kernel.org>
Received: from kernel.org (unknown [123.118.73.138])
	by natalya.videolan.org (Postfix) with ESMTP id 974C3410CFD
	for <libdvbpsi-devel@videolan.org>; Wed, 22 Dec 2021 05:48:42 +0000 (UTC)
From: soc@kernel.org
To: libdvbpsi-devel@videolan.org
Subject: Message could not be delivered
Date: Wed, 22 Dec 2021 13:48:35 +0800
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0014_64BCF2E3.C7666268"
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2600.0000
X-MIMEOLE: Produced By Microsoft MimeOLE V6.00.2600.0000

------------=_1640152124-758-1--
