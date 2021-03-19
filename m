Return-Path: <SRS0=5UrE=IR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13EEFC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Mar 2021 08:53:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1A6B64E09
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Mar 2021 08:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1A6B64E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Jebp1iJ8z5G7JSV8HIdouFIS/8YD1jTAOnH9/YMSvU=; b=OvX1Pbt26vrLfvxmTHK7TNr0W
	Ro+PPlS3OvFFzWaI6NDvNVgl9E4UHfVPHV0JNcSQ/U0TD7aRDEa3YSka1wjtck+7byn4CaGkRc2++
	ReCtcqNjg/qLdDsKCr/porjIsPt5aKltb2+E6Dl0xbSAzrfuBHnn5qzyYLZwL3EgxQOP0GF16T5jQ
	Nv6Dw78S8V3FNjsdOSwBvTG6zrj25A3kDHqrTKOUAwic9SyeiIiWDfu4Vxjljo67ePubZQkXcAb5G
	us2PY8ozzabX4lqTRGk9O22XIivA8GXKBI4IpJgBOuC+Imi4+fUl1zLGtjfchQF50XNNQvu+esHP5
	6CuMRUFTA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNArm-006u78-5O; Fri, 19 Mar 2021 08:52:22 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNArM-006u44-8c
 for linux-arm-kernel@lists.infradead.org; Fri, 19 Mar 2021 08:51:58 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:207d:4b39:ec21:2531])
 by andre.telenet-ops.be with bizsmtp
 id i8rt2400i3CXdgx018rtci; Fri, 19 Mar 2021 09:51:54 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lNArJ-008kfw-F5; Fri, 19 Mar 2021 09:51:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lNArI-00BMy5-Ud; Fri, 19 Mar 2021 09:51:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v5.13
Date: Fri, 19 Mar 2021 09:51:44 +0100
Message-ID: <20210319085146.2709844-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319085146.2709844-1-geert+renesas@glider.be>
References: <20210319085146.2709844-1-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_085156_623309_C43C0587 
X-CRM114-Status: UNSURE (   6.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210319085144.rR1Od_kQRFUATa0gjAHsJJcvEuot4iem4aQ3jZzHNwA@z>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.13-tag1

for you to fetch changes up to c5929afafbafb1b0b9a14b07452a846cfca7a22e:

  ARM: shmobile: defconfig: Refresh for v5.12-rc2 (2021-03-12 09:34:57 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.13

  - Refresh shmobile_defconfig for v5.12-rc2.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v5.12-rc2

 arch/arm/configs/shmobile_defconfig | 1 -
 1 file changed, 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
