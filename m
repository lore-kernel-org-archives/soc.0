Return-Path: <SRS0=X/nU=I5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67389C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 04:12:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07C54619DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 04:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07C54619DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHH0Y7n3t965u6Xa0tjCjGsdDOJvSGxryD7CsgOlMJA=; b=OJ2vGr6sOsxnIMMHmIBH1t2U+S
	uBdH0zgVW7z+Di6bf4n/D9ghmGc98TyP5zo6pbpYtGWz3MeyhBXCram6lOdNjcKpTlScum56Gmzc1
	87PRlkjYxqDkZJ+SdgAOR0XrxSp0mhFzAL7p8mImFdfTz3+uJyejAeWsYVwp+IlTnQ2DoAEBmBjsD
	8y6mz5sd3ehBlFK8nqM6lr8Q7B7hLhnNNnUD/oTe+Wzt8dukVEqnE8Oc/RO1DVAmnR7P7RThomM4Z
	6jme+1LsesFi5gMPAjQGRlNjbP6bxcTAu6emFw91DzyRt26e0mKHMKmUL3B57CS6oIacPN3eoKSdY
	ziELOSdA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRSC3-005R2N-A8; Wed, 31 Mar 2021 04:10:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRSBm-005R0L-8X
 for linux-arm-kernel@lists.infradead.org; Wed, 31 Mar 2021 04:10:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36DB8619DE;
 Wed, 31 Mar 2021 04:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617163840;
 bh=cfDWLfWZyaUvinkgMTUFtNENs54GRQ6bKrqYv61Q6ug=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=chqu+d6qkRUHvYuNn+73GQ6RNVEf1xCDjkC/fbAfVrU0GNx1Zf1d/z5W3KVrbWeea
 GpSsnbsE8SfA/gELmFTq8ri9wNTLFrD7GivkKQP/8I48pPdNc/+IsU09oMVc8UjcXX
 StWciQn6LDed2uYB/p9kXhs+yAYELDzLz3wZeTg9vTSi19cb1MrSUEkpkcKGK7bTGF
 zlWZDRwP6plcVcbklv+vxwrKE/ap/Ki9m4m6utJYXLLAarhfDxzsp4EscGOjkwQVpk
 8RNJINVCY9LGQWTKqQ6MdbR5SjNAPvlSzLqP5Di99mo5yZDWvo6ZNUBXnB+J0kNucy
 T1HhiWr9+7eOQ==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] i.MX SoC update for 5.13
Date: Wed, 31 Mar 2021 12:10:15 +0800
Message-ID: <20210331041019.31345-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331041019.31345-1-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_051042_835693_AB34BCF3 
X-CRM114-Status: UNSURE (   6.71  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210331041015.Kk-TfMk1W1YvxgoXlh4v8AjpKArGQRDB7fg8M1-mxsE@z>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-5.13

for you to fetch changes up to f21a468832f43fdc896e29d1ed8488ba45eeb630:

  ARM: imx: Kconfig: Fix typo in help (2021-03-15 12:21:59 +0800)

----------------------------------------------------------------
i.MX SoC update for 5.13:

- A couple of typo fixes on help text and comment.

----------------------------------------------------------------
Bhaskar Chowdhury (1):
      ARM: mach-imx: Fix a spelling in the file pm-imx5.c

Nobuhiro Iwamatsu (1):
      ARM: imx: Kconfig: Fix typo in help

 arch/arm/mach-imx/Kconfig   | 2 +-
 arch/arm/mach-imx/pm-imx5.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
