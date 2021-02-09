Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84D5C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 15:15:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54E4364EB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 15:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54E4364EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2PsEvcnvG0ojba2cxgTb1LwYAr6vBkN2s2mBpZTcj5E=; b=PUeLvvHWGT4qEVuN6dih26w4e
	YgTO2VfXZCnw/KTNIeJLU1NBC6OfiDn/O2orV/F5wDybPOTbyI/rSg2jDrWMMDspKZNxxTsP+SbTF
	E4g6A/m8kJqK3ema1Fk96TTgI3NYMzU2KUS98n23UL2+0Jsp+rdEYEE58K2rSSbKuH7QBfVpcdXd4
	klEFU9/B1PejWY6H9kgqvIJzC4yHYCa/TdXtOopU2u5Vf/afOAvJuinEAHRzOeoFzACzR1NasqsQE
	HlWLuhSOFA/s/YHSNv16qpegTYv8bT1T1rJOZa+bpF0pcnT52cF9EdrG+PXGQ5ahR5d6uEYVrEqwO
	BgfniQkXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Uig-0005HX-F8; Tue, 09 Feb 2021 15:14:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9UiQ-0005DK-1B; Tue, 09 Feb 2021 15:14:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC81064E88;
 Tue,  9 Feb 2021 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612883649;
 bh=sISzvmFfKdR/yd4UNKJ8qSPNAWkQd3BSlSYsCkUMJhM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XD2A6Li4r/dXO0whxcZnDmuu/P73XO2fL2ehEGTMwh4JNkJa2T5awiPlQNM/GqFyB
 HdkqyU+JZwljLIKEZyBCC6Orm2p9wji+7AZpvar74qpOyYVWrnbJ6kJXTpHhsKpwHC
 AZaaOawU8S/PMEcaqGW+EBY5fzDmWOeI3FOCR+tqrhEO4HTkG2lyR0SmLQcy9Q2Kbl
 q9Paeu97wj3U8n4m44SJaEhZ8KhingrFKdOoZv8b5lR+YxxMtcHgGxWsdZ3dbrF3kS
 PYkQ29m3KBPA0D8pk3/EJq0qXEUvjHaJarsrmz/nMMbJ7ityXqrWIzNGLcAaa0w/sa
 aYPJ9+ngYI9mw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] ARM: multi_v7_defconfig: amlogic updtes for v5.12
Date: Tue,  9 Feb 2021 16:13:54 +0100
Message-ID: <161288360473.2910447.10678299620796355576.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7hsg6d2bxg.fsf@baylibre.com>
References: <7hsg6d2bxg.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_101410_305952_25B0DF7E 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209151354.KcadJbMOx1okRqzHyaubfWPYkMBpqUdPzvLHviu02W8@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 03 Feb 2021 11:23:07 -0800, Kevin Hilman wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-soc
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: f7d62396798cac36dc1ea530afc3e560f52ce327

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
