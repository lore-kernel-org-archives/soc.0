Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4366C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:54:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E80660295
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E80660295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UphXmXO81FORr+4qIeZdWF0NxnBK35chqRdjsN5aib0=; b=ikLVkh5EhbuqsMzBxkqQPWME8
	YZbMSPm0sv+6mp13nVdUY2TZPlF0uouj9Jzw9OZ7FqtI8uVmJaMCnZS2GKW0pcYlb0Uai8QMNwG9w
	9yadE1/PY2Re8agiACxdRQ1OkQaar7uAc7C5CxZrbQArhHXuD8Qe6DQTUDXxxDxL0Zferpx3giJLy
	Cnsx5TTrxtg4TE+c5PSeMPaD0kwJ3iIUzNyjvjxM93+xi76V5yoEJQuzvNM9ymhQwQ+0InyvumDWz
	pbjY6VfizJNwLrHSYgTWB36FrpTpLA1Pn1bECkAZNe3D/3iqot6EfcMoZ4TB2Qxx/syQ2mY4ph0HW
	j6YQTChJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l73bu-0005aL-GP; Tue, 02 Feb 2021 21:53:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l73br-0005Zq-S1
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 21:53:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F91C64E4A;
 Tue,  2 Feb 2021 21:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612302798;
 bh=/iqLl1BUbBvIq02FSb76w14k0wBG8cwfzgfHCy0DoJE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y9ISv6akuZggdUWwtfLNWZB1OroAXmHYMedVSQDzPrJorUzWDVVzs/lq0Eoce+uGT
 TSHWxR7w2h0lQqbf/2I+XpvTBfZDPEcdFT+Zp0K5DoGydvywAjy7zAd+EGPpPa5Zj6
 iqn6kIRYaxkzkZfiBIWjx4ztbbC6+fCyXpTxjvkugSYj1pk8ZdqFeJgBRtUV83JWUk
 dnujkRAK4MnYAeN2iVuRFvsWJygkbOVeszKUtjhiaKWrbdSigqlTHIDeBDeZCnWWVp
 7OOBYrfU06u0oz3VZlgzZ2LKXedBJOTFx7cbnadvvprYTA+nPh3YF+hHGGsKiKdRHc
 ZJTUWMSmDOPCg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [GIT PULL] ARM: mvebu: arm for v5.12 (#1)
Date: Tue,  2 Feb 2021 22:53:08 +0100
Message-ID: <161230250389.1905703.11481925970231429793.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87v9bbn4az.fsf@BL-laptop>
References: <87v9bbn4az.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_165320_015442_2E3C7654 
X-CRM114-Status: UNSURE (   9.48  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202215308.GRfCgHGLM1N6tPkZhqnrAGkZmIXxDJmyH_2_z90pbi8@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 01 Feb 2021 17:25:24 +0100, Gregory CLEMENT wrote:
> Here is the first pull request for arm for mvebu for v5.12.
> 
> Gregory
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 1d025e0abff92668a102c0d798a9faa228ea0896

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
