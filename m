Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4BEC64E7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 20:46:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26E3420679
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 20:46:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sTTBGMVZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLtT6P2/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26E3420679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8J3UCqBeAnvsTCRbbsxl2YnPY6D4cGn0+vt6r/OXjiY=; b=sTTBGMVZv8fZbTZmCsd2KTRv1f
	+Uw/NJsR4Pr34kKBKPoN3maKYQOFFtByveim0Ysi2rJY/WRZ5i4t5HWUsFyoh6AV5jydL44DXyA8j
	+vD6pWXWmSkdC29DkiShrwa5ycdZ5CWqaHK9PeVcLWEOO/lDML85QKjDZj7Ke2e9AM/v5ncPAOHgS
	E49yo0x7vXHqJZV69Br/rURHiSrtpRjW0AREpJxigJvwciKu+ANX8oCjaUo8ff+rfEJbtMdTHuZUi
	FOlH7EWfKvjatHEP0rN+dgCTVF4pzRriA2NN+11u/mBYNwF5QQXCDTz2D/shPTFUwNK4P9aB/p92M
	TbSQinHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkCW1-0007Hq-JA; Tue, 01 Dec 2020 20:44:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkCVy-0007Gc-SB
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 20:44:47 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3ACD6206E0;
 Tue,  1 Dec 2020 20:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606855484;
 bh=vVZ+K/b8J7gDzg0Bd0fi47AEfEtZuQondB5ry8wIBok=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=DLtT6P2/a3SPbiwFBo1NqmQdZw4YzrL84Dk7CRQ0JPmgAds0cehwJat4KtEoarOzr
 dfXDkfGlXXLT289kjAykZJf61sbn1P5m4olqp2MgPEV83eBbtb10S40Mqi3ELnPMwB
 z77o5xNvWkTvX4U4jcIovfdmcckgesAgmnPCH2Fw=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL 1/4] ARM: defconfig: samsung for v5.11
Date: Tue,  1 Dec 2020 22:44:01 +0200
Message-ID: <20201201204404.22675-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_154447_049469_E0317437 
X-CRM114-Status: GOOD (  11.62  )
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
Message-ID: <20201201204401.MrSBPIpTKdcgsf8ioCJ1LQsNZ13fcLGqINSykCRIISs@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzNjUwYjIyOGY4M2FkZGE3ZTVlZTUz
MmUyYjkwNDI5YzAzZjdiOWVjOgoKICBMaW51eCA1LjEwLXJjMSAoMjAyMC0xMC0yNSAxNToxNDox
MSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rcnprL2xpbnV4Lmdp
dCB0YWdzL3NhbXN1bmctZGVmY29uZmlnLTUuMTEKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1
cCB0byAyMjVlZjNhM2U4ZjQ4MTU0Y2E3YTRjZmU0NGQzYjU3NmFmZjJmODYwOgoKICBBUk06IG11
bHRpX3Y3X2RlZmNvbmZpZzogbWFrZSBTYW1zdW5nIEV4eW5vcyBFSENJIGRyaXZlciBhIG1vZHVs
ZSAoMjAyMC0xMS0yNSAxOTozMzoyNyArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KU2Ftc3VuZyBkZWZjb25maWcg
Y2hhbmdlcyBmb3IgdjUuMTEKCjEuIEVuYWJsZSBzb3VuZCBkcml2ZXIgZm9yIE1pZGFzIChFeHlu
b3M0NDEyIGJhc2VkKSBib2FyZHMuCjIuIEVuYWJsZSBheDg4Nzk2YyBFdGhlcm5ldCBkcml2ZXIg
Zm9yIEFydGlrNSAoRXh5bm9zMzI1MCkgYm9hcmQuCjMuIEVuYWJsZSBBdG1lbCB0b3VjaHNjcmVl
biBhbmQgU1RNUEUgQURDIGRyaXZlcnMgZm9yIFA0IE5vdGUgYm9hcmQuCjQuIEJ1aWxkIFNhbXN1
bmcgRXh5bm9zIEVIQ0kgYXMgbW9kdWxlLCB0byBtYXRjaCB0aGUgc2V0dGluZyBmb3IgdGhlIFBI
WQogICBkcml2ZXIuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1hcmVrIFN6eXByb3dza2kgKDMpOgogICAgICBBUk06IGV4
eW5vc19kZWZjb25maWc6IGVuYWJsZSBzb3VuZCBkcml2ZXIgZm9yIE1pZGFzIHBsYXRmb3JtCiAg
ICAgIEFSTTogbXVsdGlfdjdfZGVmY29uZmlnOiBlbmFibGUgc291bmQgZHJpdmVyIGZvciBNaWRh
cyBwbGF0Zm9ybQogICAgICBBUk06IG11bHRpX3Y3X2RlZmNvbmZpZzogbWFrZSBTYW1zdW5nIEV4
eW5vcyBFSENJIGRyaXZlciBhIG1vZHVsZQoKTWFydGluIErDvGNrZXIgKDIpOgogICAgICBBUk06
IGRlZmNvbmZpZzogYWRkIFNUTVBFIEFEQyBkcml2ZXIgZm9yIFA0IE5vdGUKICAgICAgQVJNOiBl
eHlub3NfZGVmY29uZmlnOiBjb21waWxlIEF0bWVsIE1YVCB0b3VjaHNjcmVlZW4gYXMgbW9kdWxl
CgrFgXVrYXN6IFN0ZWxtYWNoICgxKToKICAgICAgQVJNOiBkZWZjb25maWc6IEVuYWJsZSBheDg4
Nzk2YyBkcml2ZXIgZm9yIEV4eW5vcyBib2FyZHMKCiBhcmNoL2FybS9jb25maWdzL2V4eW5vc19k
ZWZjb25maWcgICB8IDggKysrKysrKy0KIGFyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29u
ZmlnIHwgNyArKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hcm0ta2VybmVsCg==
