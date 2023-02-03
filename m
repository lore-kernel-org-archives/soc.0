Return-Path: <SRS0=JVFz=57=mk.fqydx.top=mk4@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF4CC636D3
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 02:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8794C433D2; Fri,  3 Feb 2023 02:08:52 +0000 (UTC)
Received: from mk.fqydx.top (unknown [106.12.161.253])
	by smtp.kernel.org (Postfix) with ESMTP id 0BF5EC433EF
	for <soc@kernel.org>; Fri,  3 Feb 2023 02:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0BF5EC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=weeemake.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=mk.fqydx.top
Received: from LAPTOP-9RUQB70J (14.153.202.16) by mk.fqydx.top id hrhmb60e97cc for <soc@kernel.org>; Fri, 3 Feb 2023 10:08:48 +0800 (envelope-from <mk4@mk.fqydx.top>)
From: "Annie" <annie@weeemake.com>
Subject: test
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Sender: mk4@mk.fqydx.top
Reply-To: annie@weeemake.com
Date: Fri, 3 Feb 2023 10:08:48 +0800
X-Priority: 3
X-MSMail-Priority: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.4913
Content-Disposition: inline
Message-Id: <20230203020851.0BF5EC433EF@smtp.kernel.org>

SGkgTXIuDQoNCk5pY2UgZGF5DQoNCkhvdCBzZWxsaW5nIHByb2R1Y3RzIGZvciB5b3VyIG1hcmtl
dC4NCg0KSXQgaXMgb3VyIHBsZWFzdXJlIHRvIG9mZmVyIHlvdSBzb21lIG9mIG91ciAoaG90IHNl
bGxpbmcpIHByb2R1Y3RzIGZvciB5b3VyIG1hcmtldC50cnVzdCB5b3UgbGlrZSB0aGVtLiBPdXIg
bWFya2V0IGFuYWx5c2lzIHN1cmUgdGhlc2UgcHJvZHVjdHMgd2lsbCBiZSBob3Qgc2FsZSBpbiB5
b3VyIG1hcmtldC5Xb3VsZCB5b3UgbGlrZSB0byB0cnkgYW55IG9mIHRoZW0/IEZ1bGx5IGhvcGUg
d2UgaGF2ZSBhIGNoYW5jZSB0byBzZXJ2ZSB5b3UuDQoNCldlYnNpdGU6aHR0cHM6Ly93d3cud2Vl
ZW1ha2UuY29tLw0KDQoNCllvdXR1YmU6aHR0cHM6Ly93d3cueW91dHViZS5jb20vY2hhbm5lbC9V
Q3hSSFpfREZyWi1zTW1ERjRQVG52S3cvdmlkZW9zIA0KDQoNCmNhdGFsb2c6IGh0dHBzOi8vMWRy
di5tcy9iL3MhQXJtV1lrTFo1LXpQaE13NVNKenZBVUNCWWJmeUhRP2U9SkE4MFJ0IA0KDQpZb3Ug
Y291bGQgaGF2ZSBhIHZpZXcgb3VyIGNhdGFsb2cgYW5kIHByb2R1Y3RzIHZpZGVvIG9uIHlvdXR1
YmUgdG8ga25vdyB1cyBtb3JlLg0KDQpUaGFua3MgYW5kIGJlc3QgcmVnYXJkcyENCg==
