Return-Path: <SRS0=ol2x=5Z=padelspain.net=rebotes@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE3AC38142
	for <soc@archiver.kernel.org>; Sat, 28 Jan 2023 00:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 205CBC4339B; Sat, 28 Jan 2023 00:26:55 +0000 (UTC)
Received: from eds21.servidoresdedicados.com (eds21.servidoresdedicados.com [31.24.154.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B61DBC433D2
	for <soc@kernel.org>; Sat, 28 Jan 2023 00:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B61DBC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=padelspain.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=padelspain.net
Received: from qoyhvmi (unknown [113.123.0.172])
	by eds21.servidoresdedicados.com (Postfix) with ESMTPA id CB1BD885E9
	for <soc@kernel.org>; Sat, 28 Jan 2023 01:20:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=padelspain.net;
	s=default; t=1674865208;
	bh=cjqcs+u6FnFe4bwpuDpMMiRekfmPWzCKxhEd30p5BJc=; h=From:To:Subject;
	b=aOt6dIB7MKXdCAJ6Yr8fk2xZdr2/79MzfUoYRstP/kS2xuxcAYHXWG+u9HrNKHyf/
	 5XXDEgtndxOoQ6mkimA7ZJ4Fcg8o+c3bKmfG83VdD/yBQoes2RowAsWKjipKrsdIwv
	 nbFrzcE+fp8H5+eHRd9SDW/rARPvZUsR8/v3SsRA=
Authentication-Results: eds21.servidoresdedicados.com;
	spf=pass (sender IP is 113.123.0.172) smtp.mailfrom=rebotes@padelspain.net smtp.helo=qoyhvmi
Received-SPF: pass (eds21.servidoresdedicados.com: connection is authenticated)
From: chwdbcaxrp <rebotes@padelspain.net>
List-Id: <soc.lore.kernel.org>
To: soc <soc@kernel.org>
Subject: =?utf-8?B?VXBkYXRlIHJlc3VsdCBub3RpY2U=?=
	=?utf-8?B?Ou+8mnNvY0BrZXJuZWwub3Jn?=
Date: Sat, 28 Jan 2023 08:19:56 +0800
Message-ID: <0063d807a5e3$7fc771ff$e61b3a5e$@qoyhvmi>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0A53_01E325FF.15C552A0"
X-Mailer: Microsoft Outlook 16.0

This is a multi-part message in MIME format.

------=_NextPart_000_0A53_01E325FF.15C552A0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

DQpOb3RpY2Ugb2Ygc2FmZXR5IGNlcnRpZmljYXRlDQoNCkRlYXIgdXNlcjogW1JFQ0VJVkVSIEFE
RFJFU1NdDQoNClRvIGZ1cnRoZXIgZW5oYW5jZSB0aGUgc2VjdXJpdHkgb2YgdGhlIGVtYWlsIHN5
c3RlbQ0KDQpSZWNlbnRseSwgb3VyIGRlcGFydG1lbnQgaGFzIHVwZGF0ZWQgdGhlIHNlY3VyaXR5
IGNlcnRpZmljYXRlcyBvZiBlYWNoIGVtYWlsIHN5c3RlbS4NCg0KUGxlYXNlIG1vdmUgdGhlIG5l
dyBjZXJ0aWZpY2F0ZSBpbiB0aW1lLA0KDQpBbGwgdGhlIGUtbWFpbCBhY2NvdW50cyB0aGF0IGhh
ZG4ndCB1cGRhdGVkIHRoZSBzZWN1cml0eSBjZXJ0aWZpY2F0ZSBpbiB0aW1lIHdvdWxkIGJlIHN1
c3BlbmRlZCBmcm9tIHJlY2VpdmluZyBhbmQgc2VuZGluZyBtZXNzYWdlcy4NCg0KSWYgdGhleSBu
ZWVkZWQgdG8gcmVjb3ZlciwgdGhleSBoYWQgdG8gYXBwbHkgZm9yIGl0IHRocm91Z2ggT0EuDQoN
CltDbGljayB0byBsb2cgaW5dDQo=

------=_NextPart_000_0A53_01E325FF.15C552A0
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDQuMCBUcmFuc2l0aW9uYWwv
L0VOIj4NCjxIVE1MPjxIRUFEPg0KPE1FVEEgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0
Zi04IiBodHRwLWVxdWl2PUNvbnRlbnQtVHlwZT4NCjxNRVRBIG5hbWU9R0VORVJBVE9SIGNvbnRl
bnQ9Ik1TSFRNTCAxMS4wMC45NjAwLjE4MzE1Ij48L0hFQUQ+DQo8Qk9EWT48U1RST05HPjxTUEFO
IHN0eWxlPSJGT05ULVNJWkU6IDI0cHgiPjxTVFJPTkc+PFNQQU4gDQpzdHlsZT0iRk9OVC1TSVpF
OiAxNnB4Ij48U1RST05HPg0KPFAgYWxpZ249Y2VudGVyPjxTVFJPTkc+PFU+Tm90aWNlIG9mIHNh
ZmV0eSBjZXJ0aWZpY2F0ZTwvVT48L1NUUk9ORz48L1A+DQo8UCBhbGlnbj1jZW50ZXI+PFNUUk9O
Rz48VT5EZWFyIHVzZXI6IFtSRUNFSVZFUiBBRERSRVNTXTwvVT48L1NUUk9ORz48L1A+DQo8UCBh
bGlnbj1jZW50ZXI+PFNUUk9ORz48VT5UbyBmdXJ0aGVyIGVuaGFuY2UgdGhlIHNlY3VyaXR5IG9m
IHRoZSBlbWFpbCANCnN5c3RlbTwvVT48L1NUUk9ORz48L1A+DQo8UCBhbGlnbj1jZW50ZXI+PFNU
Uk9ORz48VT5SZWNlbnRseSwgb3VyIGRlcGFydG1lbnQgaGFzIHVwZGF0ZWQgdGhlIHNlY3VyaXR5
IA0KY2VydGlmaWNhdGVzIG9mIGVhY2ggZW1haWwgc3lzdGVtLjwvVT48L1NUUk9ORz48L1A+DQo8
UCBhbGlnbj1jZW50ZXI+PFNUUk9ORz48VT5QbGVhc2UgbW92ZSB0aGUgbmV3IGNlcnRpZmljYXRl
IGluIA0KdGltZSw8L1U+PC9TVFJPTkc+PC9QPg0KPFAgYWxpZ249Y2VudGVyPjxTVFJPTkc+PFU+
QWxsIHRoZSBlLW1haWwgYWNjb3VudHMgdGhhdCBoYWRuJ3QgdXBkYXRlZCB0aGUgDQpzZWN1cml0
eSBjZXJ0aWZpY2F0ZSBpbiB0aW1lIHdvdWxkIGJlIHN1c3BlbmRlZCBmcm9tIHJlY2VpdmluZyBh
bmQgc2VuZGluZyANCm1lc3NhZ2VzLjwvVT48L1NUUk9ORz48L1A+DQo8UCBhbGlnbj1jZW50ZXI+
PFNUUk9ORz48VT5JZiB0aGV5IG5lZWRlZCB0byByZWNvdmVyLCB0aGV5IGhhZCB0byBhcHBseSBm
b3IgaXQgDQp0aHJvdWdoIE9BLjwvVT48L1NUUk9ORz48L1A+DQo8UCBhbGlnbj1jZW50ZXI+PEEg
DQpocmVmPSJodHRwOi8vcG1haWwuY2NveWZkaXkuY29tLz9wYWRlbHNwYWluLm5ldC8/c29jQGtl
cm5lbC5vcmciPjxTVFJPTkc+W0NsaWNrIA0KdG8gbG9nIA0KaW5dPC9TVFJPTkc+PC9BPjwvUD48
L1NUUk9ORz48L1NQQU4+PC9TVFJPTkc+PC9TUEFOPjwvU1RST05HPjwvQk9EWT48L0hUTUw+DQo=

------=_NextPart_000_0A53_01E325FF.15C552A0--

