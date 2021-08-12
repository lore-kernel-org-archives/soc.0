Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F6CC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:08:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E246109D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1E246109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktdaKiDArUPXTyIvCtcNrLbeexYMmBJj/2z9n8QIa0o=; b=pO4WhuKZaaPwc4
	ANMO4CAfBn4nfKDen6OpbmrR9IlQsN1nA6G+9pRgUGdYtrVyL4eO6+6m2ntyt9i/A8z9egqzbo8hZ
	iN1q5FzbeyZuw3azxpj0CG+1pbdVqOIdOAhNgslb6O5xgb67LC37lgeEwpDaVMwD1R69jeSiX1DwV
	MHB5Sojwyi0/1gGMrgEVTcJMGdGLXpk3NrvBnIG7N0EXFPZ/v0V0f/DIT8pLOlLn6pNmGc/3g/do+
	rSbeBa3LwyHEQ7toYmLTDle2t3vT6yoSL5CSRbIv2qQh8RKJq5tBqQlUJXKTFv9jgW6SLniDLgjs8
	l9jHR6CGLe7BtBKUJhfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHtj-00BJTU-Oi; Thu, 12 Aug 2021 21:05:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHtf-00BJSR-SM
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 21:05:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6F0D60ED5;
 Thu, 12 Aug 2021 21:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628802351;
 bh=M7CS3hy5FHYqtbakU+djiQ3z3fJ8w649qJ1OzlO1WCM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BCQbR738Lszwx1ov4c5R8zaN5Ri8aqSPVjYNd2cQKDMnBh4CzrmJi7E5CslVB7Loj
 W2sA+H5km8I02JHEqVABk11+I/15YrnxsRDmbHr8UrCnQz95Yu6if/3fbBkXx93pho
 yZZPywVjsTpcUQUcXBP2fAJzh24MQdgYYieC5EgZnUTcNGfvwvviz2GOI+KnvaQIIN
 Mag2chAFZX1RGtXpTG+cGWhw9NWC7YUODPFVuOjbCXGyk2VjBeKPjpnLJCKTi6edZs
 tSReZ2LYvqNogE9Ebc8Njg3p30t+a6D2ah4fJAkj1+oMB4Hw8+nSXFHSf5QasNhWuT
 tytIbq5O9PRjw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Kevin Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
 Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Marek Vasut <marex@denx.de>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [GIT PULL] STM32 DT changes for v5.15 #1
Date: Thu, 12 Aug 2021 23:05:35 +0200
Message-ID: <162880206112.1376011.3171809385171083085.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <e4f0bea3-4065-38d5-f1b2-007e4094c4a8@foss.st.com>
References: <e4f0bea3-4065-38d5-f1b2-007e4094c4a8@foss.st.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_140551_978523_899FC083 
X-CRM114-Status: UNSURE (   7.13  )
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
Message-ID: <20210812210535.xn0Ce2cKVK3J1U6z3YYRK5Kr1pXt4xU9T9U6CxuSckQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 6 Aug 2021 12:58:17 +0200, Alexandre TORGUE wrote:
> Please consider this first round of STM32 DT updates for v5.15. A small
> PR containing mainly dtbs_check warnings fix for ST and DH boards.
> 
> regards
> Alex
> 
> The following changes since commit 15f68f027ebd961b99a1c420f96ff3838c5e4450:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 57798ff216ebf1145bbbd5ea014ad65a72c1d064

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
