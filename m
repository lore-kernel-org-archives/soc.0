Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCADC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:36:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 853B5233CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 853B5233CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5YnhFEvRVUQQog2ZAZ8lv7nqLQdGCvVSd5FXhNgi5k4=; b=H1evVwOTEnF7lHRmSnERF3V07
	drA+cbvsA2cvurXmWbZQAGofd1peZ/MC/BZO0qaeIJERpxI2RUVlKFRFVtlBf1eg53xNI+GGqFfRO
	B5fgyVNjTBkIIm0374j26eJgrk6xVz4dh/sPsyDqE1ESXSr5m/ChBuQoowKa32tBictTyCfy2lZ0N
	kyuQvlAtIuK3MNojAbrPGAeAMVPsSqtE+N5pdJEjkwlY6dlhDkKpyj7y0wlpUZtPwz79ydRPtkRsw
	KZ6RM00guri42uo9E/cAjYuyVvgXeTIgyZ8G3xxqlBXA+1F49Z7yYCoKBOCOcODRBs6zS9F40dBqm
	EdHu06aig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfxC-0001Hw-4x; Tue, 08 Dec 2020 16:35:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfx9-0001HN-Qt
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 16:35:04 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, arm@kernel.org,
 soc@kernel.org
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.11
Date: Tue,  8 Dec 2020 17:34:45 +0100
Message-ID: <160744513987.359082.6744128367341808542.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127215517.GA1733715@piout.net>
References: <20201127215517.GA1733715@piout.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_113503_955722_D30332AD 
X-CRM114-Status: UNSURE (   8.29  )
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
Cc: linux-arm-kernel@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208163445.kLFpHSAPpzixJhGv4hlB_SLyc-cDmvYAj_C-9QWGu70@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 27 Nov 2020 22:55:17 +0100, Alexandre Belloni wrote:
> Arnd, Olof,
> 
> Two patches limiting the number of compiled media drivers.
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: d4ff08d6e2227086a4946c3f557aa06ce3b67208

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
