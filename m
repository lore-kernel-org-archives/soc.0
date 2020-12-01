Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CDEC64E7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 20:46:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB14E206E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 20:46:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ThNCIHiR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4Qj7p1W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB14E206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wmjXdsLxFUVWWmBtsnlRjjTmkKMqYsxCqVTOSfSlydU=; b=ThNCIHiRbqp8X56/tNbBtBs/U
	NSO485e9ONVMVxqXH/IgNXLj5bXmD3g4cPspZJ5RcNFV0NGh28iJTubmoBozbIhgYdMfvxRVdAwB8
	pHxqHdB+vyyML4ucxrtySszLNQobZa0qzUc+GUHoxVLJKfBeNUTqnWywaeW4Z1KxGNCNC/4bd6QgU
	/k//AEoLdWpAeTAjH7Z2y7cM4k5tyzoJWCMaI6wGIXYfR9ewPjqbgKkWkWPaM30ITDtSTOFmY3faA
	w04vn+av6kmRp1zdZnvkH+F2qJUpE1jHN7HtwEfQ2Lz2kE4fQg5Jx3pyA8At8ErKMBH66XCQ5b9yk
	mdumTeNPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkCW7-0007JD-Pe; Tue, 01 Dec 2020 20:44:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkCW1-0007Hu-R0
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 20:44:51 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BF9321D7F;
 Tue,  1 Dec 2020 20:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606855489;
 bh=6cXeaIeIdbmC+HYmVDVTPFolLEAgizsqHOBdzvUx6pU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q4Qj7p1WIJfSAo/6V/zyB+bl4ee41qN4QjmNTfDDoq5aOJ+uHeIqUldolKTzeMumw
 mMljRFXOMOzw8P/VNFXIFVI7oCiEEr5djeY9ra7tDfi62tL3Nmy0TRwdYtNzZQM/ll
 Q3/3FkaSIr0tm6L79q0yUf3jsKOtg3HLArTpIgFc=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL 3/4] arm64: dts: exynos: Pull for v5.11
Date: Tue,  1 Dec 2020 22:44:03 +0200
Message-ID: <20201201204404.22675-3-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201204404.22675-1-krzk@kernel.org>
References: <20201201204404.22675-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_154450_054517_36AB270A 
X-CRM114-Status: GOOD (  11.96  )
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
Message-ID: <20201201204403.ei-IPQGlTo93MhDTiv6HQWbYwwd7gM7J6Bhc0bu0gLs@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzNjUwYjIyOGY4M2FkZGE3ZTVlZTUz
MmUyYjkwNDI5YzAzZjdiOWVjOgoKICBMaW51eCA1LjEwLXJjMSAoMjAyMC0xMC0yNSAxNToxNDox
MSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rcnprL2xpbnV4Lmdp
dCB0YWdzL3NhbXN1bmctZHQ2NC01LjExCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8g
Zjc0ZTkzMDMyZGYyMjlhODM1ODYxN2U1ODZiYTg5Zjc0NGQ1ZGJjZDoKCiAgYXJtNjQ6IGR0czog
ZXh5bm9zOiBEcm9wIGluY29ycmVjdCB1c2Ugb2YgaW8tY2hhbm5lbC1yYW5nZXMgcHJvcGVydHkg
KDIwMjAtMTEtMTcgMjA6NDc6NTUgKzAxMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClNhbXN1bmcgRFRTIEFSTTY0IGNo
YW5nZXMgZm9yIHY1LjExCgoxLiBTZXZlcmFsIGNsZWFudXBzLCBpbmNsdWRpbmcgYWxpZ25pbmcg
bm9kZSBuYW1lcyB3aXRoIGR0c2NoZW1hLgoyLiBBZGQgV2lGaS9QQ0llIHRvIFRNMiBib2FyZHMg
KEV4eW5vczU0MzMpLgozLiBDb3JyZWN0IHJlc3RhcnQgYW5kIHNodXRkb3duIG9mIEV4eW5vczcg
Ym9hcmRzLCBhcyBwYXJ0IG9mIFBhd2XFggogICBDaG1pZWwgRXh5bm9zNzQyMCBtYWlubGluaW5n
IGVmZm9ydC4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KSmFlaG9vbiBDaHVuZyAoMSk6CiAgICAgIGFybTY0OiBkdHM6IGV4
eW5vczogYWRkIHRoZSBXaUZpL1BDSWUgc3VwcG9ydCB0byBUTTIoZSkgYm9hcmRzCgpKb25hdGhh
biBDYW1lcm9uICgxKToKICAgICAgYXJtNjQ6IGR0czogZXh5bm9zOiBEcm9wIGluY29ycmVjdCB1
c2Ugb2YgaW8tY2hhbm5lbC1yYW5nZXMgcHJvcGVydHkKCktyenlzenRvZiBLb3psb3dza2kgKDQp
OgogICAgICBhcm02NDogZHRzOiBleHlub3M6IGFkanVzdCBub2RlIG5hbWVzIHRvIERUIHNwZWMg
aW4gRXh5bm9zNTQzMyBUTTIKICAgICAgYXJtNjQ6IGR0czogZXh5bm9zOiBhZGp1c3Qgbm9kZSBu
YW1lcyB0byBEVCBzcGVjIGluIEV4eW5vczcgRXNwcmVzc28KICAgICAgYXJtNjQ6IGR0czogZXh5
bm9zOiByZW1vdmUgcmVkdW5kYW50IHN0YXR1cz1va2F5IGluIEV4eW5vczU0MzMgVE0yCiAgICAg
IGFybTY0OiBkdHM6IGV4eW5vczogdXNlIGh5cGhlbnMgaW4gRXh5bm9zNTQzMyBub2RlIG5hbWVz
CgpQYXdlxYIgQ2htaWVsICgyKToKICAgICAgYXJtNjQ6IGR0czogZXh5bm9zOiBJbmNsdWRlIGNv
bW1vbiBzeXNjb24gcmVzdGFydC9wb3dlcm9mZiBmb3IgRXh5bm9zNwogICAgICBhcm02NDogZHRz
OiBleHlub3M6IENvcnJlY3QgcHNjaSBjb21wYXRpYmxlIHVzZWQgb24gRXh5bm9zNwoKU2VyZ2Ug
U2VtaW4gKDEpOgogICAgICBhcm02NDogZHRzOiBleHlub3M6IEhhcm1vbml6ZSBEV0MgVVNCMyBE
VCBub2RlcyBuYW1lCgogYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy1idXMu
ZHRzaSAgICAgfCAxMCArKy0tLQogYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQz
My1waW5jdHJsLmR0c2kgfCAgMiArLQogLi4uL2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRt
Mi1jb21tb24uZHRzaSAgICAgfCAzOSArKysrKysrKysrKysrLS0tLQogYXJjaC9hcm02NC9ib290
L2R0cy9leHlub3MvZXh5bm9zNTQzMy5kdHNpICAgICAgICAgfCA0OSArKysrKysrKysrKysrKysr
KystLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M3LWVzcHJlc3NvLmR0cyAg
ICB8ICAyICstCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M3LmR0c2kgICAgICAg
ICAgICB8IDE1ICsrKy0tLS0KIDYgZmlsZXMgY2hhbmdlZCwgODQgaW5zZXJ0aW9ucygrKSwgMzMg
ZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==
