Return-Path: <SRS0=LG8l=PH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F42C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Oct 2021 14:14:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D9EE61057
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Oct 2021 14:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D9EE61057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LLDVVMvcjV4bocbX4p+YgiiMVFt5aEuBAd/MWMNC51Y=; b=fVZLgmCBirpq8h
	Wh2HicwfJxPUrnYGMaT6iA43JvLnOkNpTYsv4IKxRBEzOFLl93NEcBUc8Ffei9n5t4/ahbw734CBy
	bS9ho90ZisP/bPyq6bg/UFt1Ta/CZoBxTPOf7/23pfEvyBfp7jtqI8aXH75VwmqcCed4sch22z8My
	E//kqCJCacqoDrhDPYjnp0wB9eJyBL8V/WYFXsCixHnbdHO8kXaGACpLQtF/R+E5i55keAqb/Bi0+
	F09V/swicS/1QsYy8E4epCzFykF3DCwHl1QycaW/2AOED1Rni/DWS51Cg4AGLZaGlZNH4HzPLaBJ4
	223NXs3vK3J0JkP2IGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcprj-001VEJ-Ic; Tue, 19 Oct 2021 14:13:19 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcprd-001VCU-2x
 for linux-arm-kernel@lists.infradead.org; Tue, 19 Oct 2021 14:13:17 +0000
Received: by mail-lj1-x234.google.com with SMTP id d13so6557467ljg.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 19 Oct 2021 07:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/25LReJpLmexJOLsg1U4LuPGd27FRP03kBeKy7B8I5o=;
 b=PtXf40cExBsKA6nV5e77WfUEMxzkT2NFQnPtC51Tu9UOotsDNjZoMbvVM/+d40IM9h
 dQmyjQ1bAXa6nMhcNsNH2cmus5iQJHjWtdU6YRrA7XdZRFtrolWVr+WjdSdYYZ/bMGyR
 W26A2vfhvBBB7zEXD299MRX57UMNCuDQjoEFPTA6SPtj3AnA2XychO6W4PieX3DNtf9n
 jcrILVHDbCcjJPYq0nLZCbndOcZUhR/nPMagLtsQ5TkMPCZHudEuRGJumsgyOWnH9bEB
 vXoR/wUCO7+ZYiW0hKWxQ2kdt2BX0zIgArk+BaLwC+pqtzMwsIsmcDx3vFNl0VGVWn5y
 Wkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/25LReJpLmexJOLsg1U4LuPGd27FRP03kBeKy7B8I5o=;
 b=TghrvTXJX5LpcVXDSTDZglYMcLCdddjX+vWsrKze8qo1Ttz2MQCxJT5STldPSbmdxu
 Lh0gbgXuYwbPKCMZ/f+Ur1ItPDYAY/8BdpkVSOtW5IGgJPDkDbtlRy31braQWr/xoiaN
 Cgd5VFrexw5ifczqD7xXy6EdOxG3G/dv+R48B45C7URfOV/xOsxYAEr/UHliC/bQYxRS
 yObHBVENbLzQItc5XRooK3E5Gq5iQmI3RwbW2bYnCEZwpXO/FBd6Sm1Ib19dcxNcZrXo
 Zk559vj/CQrxVkvSctjsx7qjesYnmKqAO4MDgpvUKrNTEUe992K4psT647sZ0gw1fLgv
 hzKA==
X-Gm-Message-State: AOAM533V/+FsqkKapis23mUaTk3SSIdtYzndxQNg0+C4TpyqEdWL5dg5
 oZs6OqXv5ZuhciQ4zIbI3Gur/w==
X-Google-Smtp-Source: ABdhPJzPP4EtERsJnIetXPWwwfIY3iWtk4TXNDwY/nr3BsDBbk3teRY3BsGmScoX1PK5HNNXeEvo3A==
X-Received: by 2002:a2e:6818:: with SMTP id c24mr7148268lja.471.1634652789734; 
 Tue, 19 Oct 2021 07:13:09 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id d24sm1957805ljc.2.2021.10.19.07.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 07:13:09 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: dinguyen@kernel.org, robh+dt@kernel.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@semihalf.com,
 mw@semihalf.com, jam@semihalf.com, ka@semihalf.com, tn@semihalf.com,
 amstan@google.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v4 0/2] Add support for the Mercury+ AA1 module
Date: Tue, 19 Oct 2021 16:12:26 +0200
Message-ID: <20211019141228.1271617-1-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_071313_150277_409DD76C 
X-CRM114-Status: GOOD (  10.51  )
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
Message-ID: <20211019141226.OGQqOLgf6qZMOuraeGD5dWsPhV-29Tap7kE1E-I5mh0@z>

VGhlIGZvbGxvd2luZyBwYXRjaGVzIGFkZCBzdXBwb3J0IGZvciB0aGUgTWVyY3VyeSsgQUExIHdp
dGggYW4KQXJyaWEgMTAgU29DRlBHQS4KCnY0OgoqIG1vdmUgZGV2aWNldHJlZSBhbGlhc2VzIHRv
IHNvY2ZwZ2FfYXJyaWExMC5kdHNpCiogc29ydCBhcnJpYTEwIGVudHJpZXMgaW4gYXJjaC9hcm0v
Ym9vdC9kdHMvTWFrZWZpbGUKCnYzOgoqIHJlcGxhY2UgaTJjIGJ1c25vIHByb3BlcnR5IHdpdGgg
ZGV2aWNldHJlZSBhbGlhc2VzCiogcmVzZXQgY29udHJvbGxlciBwYXRjaCBhZGRlZCB0byBQaGls
aXBwIFphYmVsJ3MgdHJlZQoKdjI6CiogcmVtb3ZlIHNwaSBmbGFzaCBub2RlCiogcmVuYW1lIG1l
bW9yeSBhbmQgbWRpbyBub2RlcwoqIGFkZCBncGlvIG5vZGVzCiogYWRkIGJ1c25vIHByb3BlcnR5
IHRvIGRlc2lnbndhcmUgaTJjIGRyaXZlcgoKUGF3ZcWCIEFuaWtpZWwgKDIpOgogIHJlc2V0OiBz
b2NmcGdhOiBhZGQgZW1wdHkgZHJpdmVyIGFsbG93aW5nIGNvbnN1bWVycyB0byBwcm9iZQogIHNv
Y2ZwZ2E6IGR0czogbW92ZSBhcnJpYTEwIGFsaWFzZXMgdG8gc29jZnBnYV9hcnJpYTEwLmR0c2kK
CiBhcmNoL2FybS9ib290L2R0cy9zb2NmcGdhX2FycmlhMTAuZHRzaSAgICAgICB8IDEzICsrKysr
KysrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL3NvY2ZwZ2FfYXJyaWExMF9zb2Nkay5kdHNpIHwgIDcg
Ky0tLS0tCiBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXNvY2ZwZ2EuYyAgICAgICAgICAgICAgICB8IDI2
ICsrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCgotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
