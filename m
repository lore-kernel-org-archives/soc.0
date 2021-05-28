Return-Path: <SRS0=H+81=KX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D2BC47087
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 May 2021 11:30:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE9ED613D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 May 2021 11:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE9ED613D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OWptGUKk90vk1/mJbAeIkud3f3I5ofz31hjahgZ0xIs=; b=hov8EZIKJh++cX
	kQtvWQblUDDgA/StYUG1Oxo9kGPPEXgl+9bsXwhTJ5J24CV+LDOfdWwP3Iw8I5uMxEOhiBgVd1IdL
	0fFdC8E678431Ksw2K+ikp4Hy34kftnx+8SvSTParwweMkeHgxuOi+m8+cWDc3MgLtEjaKBMmdbDE
	efKCsTIFZA9+fTDY5CkdrLOzrxszgeEymH/VrVRDjUvmDoDbv+FKMXwAmGdPBN6GECn4TtyeaDHBV
	b29J2WWIydcxkdy6o9Z/OgdO0SeqP4wGLgjwrbDjbWAJbpTjs8LJ6L5MaQbgMJO8ckcWMnIAGrrMl
	kaV0PITI1ljH4F5ybIGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmaeE-00Eq62-Mp; Fri, 28 May 2021 11:27:28 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmZqQ-00EQoo-2K
 for linux-arm-kernel@lists.infradead.org; Fri, 28 May 2021 10:36:01 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:751e:82a3:f2a2:3459])
 by andre.telenet-ops.be with bizsmtp
 id AAbs2500f20MPSF01Absbu; Fri, 28 May 2021 12:35:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lmZqK-00AD9W-8a; Fri, 28 May 2021 12:35:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lmXtS-007G5u-In; Fri, 28 May 2021 10:30:58 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas ARM SoC updates for v5.14
Date: Fri, 28 May 2021 10:30:48 +0200
Message-ID: <cover.1622188833.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_033558_306852_56090A52 
X-CRM114-Status: GOOD (  13.74  )
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
Message-ID: <20210528083048.Jl0dyusXiwg4f3If6RDbTFgDysVkXF4j5F235rwY5kY@z>

	Hi soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.14.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas ARM defconfig updates for v5.14

    - Refresh shmobile_defconfig for v5.13-rc1
    - Enable R-Car USB2 clock selector support

  [GIT PULL 2/2] Renesas ARM DT updates for v5.14

    - GPIO extender support for the Falcon development board,
    - Switches support for the ALT development board,
    - Miscellaneous fixes and improvements.

Note that the second part is based on v5.13-rc3, as older versions do
not include tags/renesas-arm-dt-for-v5.13-tag3.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
