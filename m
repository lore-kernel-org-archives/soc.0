Return-Path: <SRS0=LG8l=PH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC0DC4332F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Oct 2021 15:14:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD8EE60FDA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Oct 2021 15:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD8EE60FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iO+gbAEPoo1d8eZXyVxxCXdHagskqwvUmq4FS92j+0U=; b=Fp/DRRXyj2d9k2
	BfsTC7SYUPO0AFW4+Uhy7QDuBN7pFPRcWIMY/iBCHfxeW6Oq+SrCCc7AisPAKsEjLkm58q2pcyCy+
	tVYiJtsraBm7ODeDrPVmbfK/88R54w+5XgfjV6DQksImYc3r6zFLz1oJDK5lNdoys26Gr24v29HwV
	LX4n0FDNq39hPm6+kcvKv87veMxET5+lWnEm6t2QK4whqUwErAWUqJS0FPQFY6j6ZWZJ15TUp54Hz
	GEarsIdiOP/9B8qwYIK/3Zgje32JxJxNr/+tzu/MD9sI2Ri9Ov5vq7SBRpaQpxeoFWC494ht6zKE0
	InsmLayy0+f1pjIlzMsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcqnY-001en6-1G; Tue, 19 Oct 2021 15:13:04 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcqnS-001ekg-Qn
 for linux-arm-kernel@lists.infradead.org; Tue, 19 Oct 2021 15:13:00 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mcqnL-0005LR-HD; Tue, 19 Oct 2021 17:12:51 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mcqnL-0000Zn-6S; Tue, 19 Oct 2021 17:12:51 +0200
Message-ID: <b378f2aae54538db6a13c98561b4cbcacbef937c.camel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v5.15
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date: Tue, 19 Oct 2021 17:12:51 +0200
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_081258_909576_4F1CCEA9 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211019151251.0lXJ-1qGxMmtbPXO14SmhcFKWq2y44xzgh3vVjLjcTI@z>

RGVhciBTb0MgbWFpbnRhaW5lcnMsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0
IDY4ODBmYTZjNTY2MDFiYjhlZDU5ZGY2YzMwZmQzOTBjYzVmNmRkOGY6CgogIExpbnV4IDUuMTUt
cmMxICgyMDIxLTA5LTEyIDE2OjI4OjM3IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0
IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdC5wZW5ndXRyb25peC5kZS9wemEvbGludXggdGFn
cy9yZXNldC1maXhlcy1mb3ItdjUuMTUKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAz
YWQ2MGI0YjM1NzA5MzdmMzI3ODUwOWZlNjc5N2E1MDkzY2U1M2Y4OgoKICByZXNldDogc29jZnBn
YTogYWRkIGVtcHR5IGRyaXZlciBhbGxvd2luZyBjb25zdW1lcnMgdG8gcHJvYmUgKDIwMjEtMTAt
MDUgMTI6MjM6MTYgKzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClJlc2V0IGNvbnRyb2xsZXIgZml4ZXMgZm9yIHY1
LjE1CgpGaXggdGhlIHN0YXR1cyBiaXQgcG9sYXJpdHkgaW4gdGhlIGJyY21zdGItcmVzY2FsIGRy
aXZlciwgcmUtZW5hYmxlCnBpc3RhY2hpbyBkcml2ZXIgc2VsZWN0aW9uIGFmdGVyIE1BQ0hfUElT
VEFDSElPIHJlbW92YWwsIGFkZCB0cmFuc2ZlcgplcnJvciBoYW5kbGluZyBpbiB0aGUgdGVncmEt
YnBtcCBkcml2ZXIsIGFuZCBmaXggcHJvYmluZyBvZiB0aGUKcmVzZXQtc29jZnBnYSBkcml2ZXIg
YWZ0ZXIgcmVjZW50IGRldmljZSBsaW5rIGNoYW5nZXMuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkdlZXJ0IFV5dHRlcmhv
ZXZlbiAoMSk6CiAgICAgIHJlc2V0OiBwaXN0YWNoaW86IFJlLWVuYWJsZSBkcml2ZXIgc2VsZWN0
aW9uCgpKaW0gUXVpbmxhbiAoMSk6CiAgICAgIHJlc2V0OiBicmNtc3RiLXJlc2NhbDogZml4IGlu
Y29ycmVjdCBwb2xhcml0eSBvZiBzdGF0dXMgYml0CgpNaWtrbyBQZXJ0dHVuZW4gKDEpOgogICAg
ICByZXNldDogdGVncmEtYnBtcDogSGFuZGxlIGVycm9ycyBpbiBCUE1QIHJlc3BvbnNlCgpQYXdl
xYIgQW5pa2llbCAoMSk6CiAgICAgIHJlc2V0OiBzb2NmcGdhOiBhZGQgZW1wdHkgZHJpdmVyIGFs
bG93aW5nIGNvbnN1bWVycyB0byBwcm9iZQoKIGRyaXZlcnMvcmVzZXQvS2NvbmZpZyAgICAgICAg
ICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvcmVzZXQvcmVzZXQtYnJjbXN0Yi1yZXNjYWwuYyB8
ICAyICstCiBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXNvY2ZwZ2EuYyAgICAgICAgfCAyNiArKysrKysr
KysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9yZXNldC90ZWdyYS9yZXNldC1icG1wLmMgICAg
IHwgIDkgKysrKysrKystCiA0IGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hcm0ta2VybmVsCg==
