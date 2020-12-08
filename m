Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0D1C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:12:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2797A23AFB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2797A23AFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9TtAkM2iXLuHhYoaBHVCrNpAFZdfa7GCwbudB7aXGFo=; b=Ek/dxLsy/+cLsQQpHfuM39KJF
	ZbeNGLOU0eMvbHg6Eq5b9XygqOpSm/k2M+XKhKK1di5cnQ0RuJAu63TDHd/vVZFGAIINlf1ViL/VK
	ALAb64fJlyrjdIxo8igOdYLuaYgxjrMJ4eRTsiRFEFFao4JfxLdrW/ABt9M9gaSvTbzik7RQPT46o
	vcpoC8JCfaIm/ya7bGN9Pg00XqnWbbdqL8Rhk3vzRu8NgO9lHWAS9LOU1LnrConNYza9bxRvuNg8L
	ahwfghyEHNrTy4qLvx+4dl8jmKRLwAJnbs5eLECnhAYyp6rw+ItZ3BUY/xYb51LeoCnWVkbDlRNXd
	UqfKF6JAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfaN-0005FL-7F; Tue, 08 Dec 2020 16:11:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfaG-0005Cq-Fw
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 16:11:26 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC 1/2] MAINTAINERS: correct SoC Git address (formerly: arm-soc)
Date: Tue,  8 Dec 2020 17:11:11 +0100
Message-ID: <160744385141.3969289.7559804169434250347.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201211516.24921-1-krzk@kernel.org>
References: <20201201211516.24921-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_111124_950986_6482DBB6 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, arm@kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208161111.LQmLn5WBb7Z_WxJjtMZqAn3kYul87WL5LOy2GZQMLZw@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 23:15:15 +0200, Krzysztof Kozlowski wrote:
> The SoC Git was moved from arm/arm-soc.git to soc/soc.git.  Correct the
> ARM Sub-architectures entry.

Applied to arm/fixes, thanks!

[1/2] MAINTAINERS: correct SoC Git address (formerly: arm-soc)
      commit: c99055ec2c3974386f36eb648af77a8dbe887ca9
[2/2] MAINTAINERS: add a limited ARM and ARM64 SoC entry
      commit: db2082700a0c7974c3a7787d50abff34b2695b4b

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
