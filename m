Return-Path: <SRS0=Jpgy=HB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C41BC433E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Jan 2021 11:31:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8F0E64DDD
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Jan 2021 11:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8F0E64DDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ApWpAl0wWEvIzNHCHEZWfgIYCyZDnvipR8Pn6OBIxWs=; b=gGA43hzo7O47frxK0/8IvGlyH
	xLD+GlFoBeDWn6+fWLf4WTgnR6DA4Apk/A4y1047ncBf2LOVWOtq3ZUrX+lzaFAkpbctdzHkhn84w
	PLsFZeZ5UIHowK+ssnJnQkXr/W1fI5pQQXv9Z2HmTHui/LJ0R7jD7a0FhPOqcA2KRA3kuRdEARe4D
	cmmyMX7bXjBZ9SedFwmQ3DZ4RK5TvVw9NwzUQ8VjYnkUVMLtjGQIdLZw9VnjvaPTLqoQa9+7eIWxa
	u35PpjNAuC3Mw6NGQf8ula+1mk0nbNfwqnHDpeAbUrO7q+XtKowLhxGuxWu8vTStW0xVDwZEP0jGn
	8OFZMNJ+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oTO-00009h-4e; Sat, 30 Jan 2021 11:31:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oT4-0008UO-Mm; Sat, 30 Jan 2021 11:31:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA00764E0C;
 Sat, 30 Jan 2021 11:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006266;
 bh=E4s8bdfLA97x5d7eBVfzxaXWoW6vvMAOYmnLPFUd7YA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H2ZNRXLhDf9NQa7aR26oWuiOPSiwIjDPWsWnkQLHImJTVVaKFjkZSockPPQ1/HI/7
 h/gIw4WZ1/Skxo/TtrGuuMUrUavx9UV2CX9rMc61E6YUqjr1/SgX+J4NAh1q82iuG9
 fjf6HLtVsAkXigZmS4eqr79wKF7z/Zbw+2AOp9eJXwh0YuzUiuEKeg2E55qSlyjS3y
 5CvDq0JyritBSvkRMpZNRGxn6nFVsGPeD1zgjB6wrL2nY3iXbimKvpeSrXwOkjLk5o
 /3oNrA1cR7HynJ/A7x7icWCtOz58FUWQ5FDXCiqGDGjdyvY/JgahEsIrjfzZW20P1c
 E7ImnoKPNXvew==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org,
	soc@kernel.org
Subject: Re: [GIT PULL] arm64: dts: amlogic fixes for v5.11-rc
Date: Sat, 30 Jan 2021 12:30:50 +0100
Message-ID: <161200622969.2192465.15081431917114285315.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7hk0s0x3im.fsf@baylibre.com>
References: <7hk0s0x3im.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063106_910775_0452D75E 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130113050.Asuj6kugFgP1Maqh4s5E0d-10ze0w3Q_IxS68O24A3Q@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 10:41:53 -0800, Kevin Hilman wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 19f6fe976a61f9afc289b062b7ef67f99b72e7b9

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
