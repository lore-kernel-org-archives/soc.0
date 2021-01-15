Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A36C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:24:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4000420691
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4000420691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ET5YSl1b73W55wKmw/fH3Z8P80wfiVhSjjAw2jgJZoU=; b=0KeXVjsKGPFj0yPNcSpeBMizI
	nWVwCubXj/uYPUSKQbCQ8QrrrpyaEi9t6qaOtCLbwLKZU02VW6Ka6oM32vlKNQMRpeD9zBMBmEoVR
	uKjLlA1mt1mx32KxUgR/bYFWIRJpk4Qtfwajm9Hp0CXa/CCyRu5WcS/k9MtEmLQhbxjRBdNX85pdF
	TB/0Ip85ckZ5/RBO9foWs7QVsU3L1/Di7peegWiuWrKD5cH31oVkB5WjFUK3g+ZO7w0c5Zq+oQRII
	t5wdzL6RzgCrPUizf1Zgj828bVNV7Q/UopSOVMkakqhPrLQ5Vzfw6VzUVGudeJ52i5TdSaxpGm/Ob
	NQHi4y0Ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0SoG-0004cz-BQ; Fri, 15 Jan 2021 17:22:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Snk-0004Sx-VA
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 17:22:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 486FE238E7;
 Fri, 15 Jan 2021 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610731339;
 bh=SL80JnqP4VeZBqiSUAJTFlnVGZniTb+FgtlqNX1t8DA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GiQOSTlKX+rhOp2LdXtyk81vuF5DGQpHfq3+K2oZNZPPq1O5Lr3vraAPtK4QR2W29
 vX4CAUcZvWWTAvKpYRWtPbwf5uCeAieyeCd+b/xdRLHiJpfRh+64WdabrItKFa1V7n
 Eaebr3xW+hZLMvbkMQzoyniC2wdYy33V9AOmYygrXh2RoMeIKYYzvAvx7Uzz462XDM
 ku6YI5Equ1DE6s+T1TopA+Fx+V7y7natzTMznBPjy/20Q2wsW0vfP+YlYV6SXiAbfC
 EXC/yxn0cMxarhVtjJyaKUs8XRWQuEUL8O0lQqHqN10upQhEZjA587ysbNmO9N654t
 YOQbZNrr45yGQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH V2] arm64: defconfig: Drop unused K3 SoC specific options
Date: Fri, 15 Jan 2021 18:22:08 +0100
Message-ID: <161073123818.625238.13327554400808515391.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107132228.6577-1-nm@ti.com>
References: <20210107132228.6577-1-nm@ti.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_122221_186344_F4CC2586 
X-CRM114-Status: UNSURE (   7.99  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115172208.5xGrO-PfldtwYw9T69F5_ksw6OlqRKqo_LoD29h8z5s@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 7 Jan 2021 07:22:28 -0600, Nishanth Menon wrote:
> With [1] integrated and all users of the config symbols removed, we
> can safely remove the options from defconfig.
> 
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20201026170624.24241-1-nm@ti.com/

Applied to arm/fixes, thanks!

[1/1] arm64: defconfig: Drop unused K3 SoC specific options
      commit: 2004e62a2a06b9029f7d728a0b5d19a499569184

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
