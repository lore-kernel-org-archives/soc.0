Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295BDC71155
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 20:46:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DED520679
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 20:46:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ppmzoOE9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftu0DqYU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DED520679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dmbuZq/yN79CCGCsEK2uQF8kJ1HsRNpp3Ml+Jp6j4h8=; b=ppmzoOE9PXmAdT9GpDNozVVlp
	OUUIcw7dypuMN+6CiXG6LccnFheWkh7XS0ZnbhiTpD2QkmgE+/dtK7MVuDc2yxvCzfISHEFTn1cpL
	VQZJWDDCkXMQrxlA0/hdgOcZM/IGBLqjJwv1xqePr7Ut5WclwCI2DfVnknppNhWJTuqWpPlAK0TR+
	h7Mj4K9OLGypEriZz8MWrKIBSA0pDN2CB3QeOvIodSDES63BSEiQkOIt4Z0LueFt2tVWozxjhKcr3
	UHBIzE+uGzO2WrzkFVx6eF7jA1V3Je8PhPp2GcvC1qcbRgToZYtT7DA/3CjKSx3khwiGKouH6RWK3
	xr0pio0SA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkCWC-0007K0-Lw; Tue, 01 Dec 2020 20:45:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkCW3-0007IN-P8
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 20:44:52 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 67A6F2222C;
 Tue,  1 Dec 2020 20:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606855491;
 bh=8cGy04ttJFLiZMeZh4SVSsHJh9klFNPk4fJacT2rFCo=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ftu0DqYU4kD8uUZcV1SkuqleKk9q4Qdv6DHU+f7UouI1h0AxLWy0Xk6SAV1n235jy
 YsKDgR9Bvw8nc/BJf4RLIkOnd7pXK/6sFAlZKNWOpv6JcWSyyLBRUlHCP8QKA4gZwM
 9ASuja6NBHFVbrPDYfywchUopmr+BhTm5T7uFB5o=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL 4/4] ARM: samsung: Pull for v5.11
Date: Tue,  1 Dec 2020 22:44:04 +0200
Message-ID: <20201201204404.22675-4-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201204404.22675-1-krzk@kernel.org>
References: <20201201204404.22675-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_154451_982817_415F2F7B 
X-CRM114-Status: GOOD (  12.87  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201204404.0EoCJSfxCX4GkK0P5xbxZWvDYq_MJrRmkN7lL4P8KOs@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzNjUwYjIyOGY4M2FkZGE3ZTVlZTUz
MmUyYjkwNDI5YzAzZjdiOWVjOgoKICBMaW51eCA1LjEwLXJjMSAoMjAyMC0xMC0yNSAxNToxNDox
MSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rcnprL2xpbnV4Lmdp
dCB0YWdzL3NhbXN1bmctc29jLTUuMTEKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBm
OTEzNWFhZjI3Njc1MDBkZWU0MTljMDM2NDBmN2EzNzg0YjU2NTU5OgoKICBBUk06IGV4eW5vczog
ZXh0ZW5kIGNwdWlkbGUgc3VwcG9ydCB0byBQNCBOb3RlIGJvYXJkcyAoMjAyMC0xMS0xNiAxNzoz
MTowMSArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KU2Ftc3VuZyBtYWNoL3NvYyBjaGFuZ2VzIGZvciB2NS4xMQoK
MS4gRG8gbm90IHVzZSBvZl9tYWNoaW5lX2lzX2NvbXBhdGlibGUoKSBpbiBlYXJseSBDUFUgaG90
cGx1ZyBjb3JlLiBGdWxsCiAgIGRldmljZSB0cmVlIHdhbGsgY2F1c2VzICJzdXNwaWNpb3VzIFJD
VSB1c2FnZSIgd2FybmluZ3MuCjIuIENsZWFyIHByZWZldGNoIGJpdHMgaW4gZGVmYXVsdCBsMmNf
YXV4X3ZhbCBvZiBMMzEwIEwyQyAtIHRoZXkgYXJlIG5vdAogICBuZWVkZWQuCjMuIEV4dGVuZCBj
cHVpZGxlIHN1cHBvcnQgdG8gUDQgTm90ZSBib2FyZHMgKEV4eW5vczQ0MTIpLgoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpH
dWlsbGF1bWUgVHVja2VyICgxKToKICAgICAgQVJNOiBleHlub3M6IGNsZWFyIHByZWZldGNoIGJp
dHMgaW4gZGVmYXVsdCBsMmNfYXV4X3ZhbAoKTWFyZWsgU3p5cHJvd3NraSAoMSk6CiAgICAgIEFS
TTogZXh5bm9zOiBTaW1wbGlmeSBjb2RlIGluIEV4eW5vczMyNTAgQ1BVIGNvcmUgcmVzdGFydCBw
YXRoCgpNYXJ0aW4gSsO8Y2tlciAoMSk6CiAgICAgIEFSTTogZXh5bm9zOiBleHRlbmQgY3B1aWRs
ZSBzdXBwb3J0IHRvIFA0IE5vdGUgYm9hcmRzCgogYXJjaC9hcm0vbWFjaC1leHlub3MvZXh5bm9z
LmMgIHwgNyArKysrLS0tCiBhcmNoL2FybS9tYWNoLWV4eW5vcy9wbGF0c21wLmMgfCAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
