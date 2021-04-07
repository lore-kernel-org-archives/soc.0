Return-Path: <SRS0=LeP6=JE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF27C43461
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 07:01:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B04161184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 07:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B04161184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=65LWHVEq1gVRYqCwhFhvIWukKwdOKsCrXzFGKeKN7Mw=; b=CISAnRQbvjrw1PhG3qlhcWZwG
	wXjotqLyn/LCHOOVVbRCo8D+IfCihiJ/mavBai7Ko3SOJoVXVIxlkACoeKH1s4njoYWDRNxe1s4FB
	VpkY9jPcnEG6ULwShpczXmOCuqgM4Jw/E0Znzsr3OHuE7dM5/cNXWRuWeVhSj0rpCmFKkxHTo8zWB
	GBLYLVEbE0+7yEcvW8kx7+lZoY3/Ojd68G7r7PF/ysuWRylmRmzMSrrnbiw9cRNsotpvL2g3Gz1UQ
	XaYs6z/19eNTODInc+ZJPJ1qox1FxzaBx3Vjy+cXzF2hgtlZ1/9mXJa0SB9QyyU5rs0tmVUO2alsD
	i0BJZqfpw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU29T-004GnA-NK; Wed, 07 Apr 2021 06:59:01 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU29D-004Glo-2T
 for linux-arm-kernel@lists.infradead.org; Wed, 07 Apr 2021 06:58:45 +0000
Received: from mail-wm1-f70.google.com ([209.85.128.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lU29C-0000fN-LQ
 for linux-arm-kernel@lists.infradead.org; Wed, 07 Apr 2021 06:58:42 +0000
Received: by mail-wm1-f70.google.com with SMTP id j15so1002951wmq.6
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 06 Apr 2021 23:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LchvM2u0iW5KufEGKbahHHtTCv2rOtXQ3p5uFrGxVE8=;
 b=BFwrOHUF8SfcnHVzF6rG+o3BTEb0rJ7QOIBlFBixsodUBtb207l5/EcjQelMu6Sxdf
 qyasrIrXItRphNqbQZfhEv8IKs1ztT1kar274dRG3U876nnRjoG04iDYZSlyDgQ2r7SD
 pWH0Lz6ysFfU+4D28Qm+whbxcd+yYBUCjfjCQ5xMqM7CAun9EITHuBnu8uXzoMdLjecT
 FWMVNOaQMx6o8oXy6Po9M6FiizkCgqZG2fFgDTS3s3UwPLlcXOaE7q0cwDzP05JV58yl
 qE7OL97nS/LrAMlG9XjqMM30WyDWjShmLaX5me9ykmcCbvoSG32QQUZ9kFWwtf3wtL4A
 H04Q==
X-Gm-Message-State: AOAM531biJe50GDbWeA9Htivl7qZEzTcGWFtwc6Rta8vPbxDkEFbTPjg
 cx7f/Cilnho9dVrtxFQk5x0T/W2DeoId616VA6PAZmCRQyjep43uVruZ0OL7XCA0j5T0CIsQCGu
 qSloxaOucV9iyV3drglHapHgo69s8BjLn5X00r4+ks1aBr+rwfaEF
X-Received: by 2002:a5d:6152:: with SMTP id y18mr2442782wrt.255.1617778721598; 
 Tue, 06 Apr 2021 23:58:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb0GNMb9BXI0hktJMyfEscPsHyz/GoH02QCojLY9kbR3X8bjEYRVjpos/mCtzqKkygNyE8ug==
X-Received: by 2002:a5d:6152:: with SMTP id y18mr2442766wrt.255.1617778721479; 
 Tue, 06 Apr 2021 23:58:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id c16sm2410506wrx.46.2021.04.06.23.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 23:58:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL 3/3] ARM: samsung: mach/soc pull for v5.13
Date: Wed,  7 Apr 2021 08:58:28 +0200
Message-ID: <20210407065828.7213-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
References: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_075843_533798_2E8B8755 
X-CRM114-Status: UNSURE (   9.90  )
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
Message-ID: <20210407065828.v1j8o2CDKr0TVJ-FGD191Ifv3J49y4GWeTOsJAqH-Cc@z>

RnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgoKVGhlIGZvbGxvd2lu
ZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBhMzhmZDg3NDg0NjQ4MzE1ODRhMTk0MzhjYmIzMDgyYjVh
MmRhYjE1OgoKICBMaW51eCA1LjEyLXJjMiAoMjAyMS0wMy0wNSAxNzozMzo0MSAtMDgwMCkKCmFy
ZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rcnprL2xpbnV4LmdpdCB0YWdzL3NhbXN1
bmctc29jLTUuMTMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA2MDMxMDA4NzgwZWZh
YWRhMTgwODdlYmE3ZWM4NGZlMTQ5ZjEyNGE5OgoKICBBUk06IGV4eW5vczogY29ycmVjdCBrZXJu
ZWwgZG9jIGluIHBsYXRzbXAgKDIwMjEtMDQtMDYgMjI6MzA6MDIgKzAyMDApCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClNh
bXN1bmcgbWFjaC9zb2MgY2hhbmdlcyBmb3IgdjUuMTMKCjEuIFVwZGF0ZSBLcnp5c3p0b2YgS296
bG93c2tpJ3MgZW1haWwgYWRkcmVzcyBpbiBNYWludGFpbmVycy4KMi4gUmVwbGFjZSBkZXByZWNh
dGVkIHB3bV9yZXF1ZXN0KCkgd2l0aCBwd21fZ2V0KCkgaW4gUzNDMjR4eC4KMy4gQ29ycmVjdCBr
ZXJuZWxkb2MuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCktyenlzenRvZiBLb3psb3dza2kgKDIpOgogICAgICBNQUlOVEFJ
TkVSUzogdXNlIEtyenlzenRvZiBLb3psb3dza2kncyBDYW5vbmljYWwgYWRkcmVzcwogICAgICBB
Uk06IGV4eW5vczogY29ycmVjdCBrZXJuZWwgZG9jIGluIHBsYXRzbXAKClV3ZSBLbGVpbmUtS8O2
bmlnICgxKToKICAgICAgQVJNOiBzM2M6IFVzZSBwd21fZ2V0KCkgaW4gZmF2b3VyIG9mIHB3bV9y
ZXF1ZXN0KCkgaW4gUlgxOTUwCgogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICB8IDI0
ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLQogYXJjaC9hcm0vbWFjaC1leHlub3MvcGxhdHNtcC5j
ICB8IDI4ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIGFyY2gvYXJtL21hY2gtczNjL21h
Y2gtcngxOTUwLmMgfCAxMSArKysrKystLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRp
b25zKCspLCAzMiBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
