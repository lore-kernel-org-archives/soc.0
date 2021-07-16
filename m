Return-Path: <SRS0=r7Jl=MI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F011BC12002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:29:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B686361374
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B686361374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsWxG2Lg0FUqUOcRv1h9LJaT921yzFGwFjMReihUyCw=; b=YcoycGmn21zoVx
	i7Jgmmppo2Bq2RHC0sIKlgOO7W0zhWACenO896M9+DsabO2h9UAkJMtN8zrsAzelQKqRr5wCB3vG5
	ghZ3C+rr6UXIs/id9lPIajVGYXi8qf2FBbhez77DSHgMRktFkAoskj0APOYQ85gvzhg5K2r7oDxuP
	tUah1GyyZJB9fLXY1EQYFuWkHb0BnWK9Ha3/9PddL3wsnsyI6xH6wqX9gKRZbSiaRDKn6CvKRJz2t
	AJTzr2zsA7Et8AIl23JhPTUEYn717T3kuA2fxp90FqvMKI5TaWu4EpLIFcsS+2JbOPo4COksbMzgz
	HF/vt2E6SvHY/Oe/e8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4VMb-005Iml-Rq; Fri, 16 Jul 2021 21:27:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4VKb-005I63-GB
 for linux-arm-kernel@lists.infradead.org; Fri, 16 Jul 2021 21:25:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1B36613F6;
 Fri, 16 Jul 2021 21:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626470713;
 bh=cpO/LxM3zCHKVVkUgymvSlh80GUky+i1jcYfM8Il+Y0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c/LRQItv63qBXdk9l9tGZw5XISClzOf8GJm98Wv1DLnBSFGI4WmhC9qMlbqccA978
 njL6XOvBUbEZFPe1qe35D2nFS7r1Mhc99YCt7zSnF7gr/CtmWfuur9xDbFW/gti9ZS
 KcewFYGe0JFsYfowCoa9nT7pkJLfdsC0sLchAA7vgaJ8Ocjo+h+2uLbTNB6oOpD0sG
 xDfypig/Yjx11eph2KyFaWSuzT7WJaO/VUASTkWtEPnmf1bjg18kluLebf7SE+yv8m
 /KH+G7yzk70CkVIn0Xz3UgERzXl41aUjKrdzi0rvNpYyXWEV481ABNT6X0Jk7FZq91
 P8ZVxOLeNA+Jg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ARM: configs: Update RealView defconfig
Date: Fri, 16 Jul 2021 23:24:47 +0200
Message-ID: <162647049954.3478428.6104016055388261794.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210714090040.182381-1-linus.walleij@linaro.org>
References: <20210714090040.182381-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_142513_595084_ABB2D661 
X-CRM114-Status: UNSURE (   9.80  )
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
Message-ID: <20210716212447.ogKx3C7WWYj-A5OscZqivoUWm2I85_L3-PdeXkBaMMw@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 14 Jul 2021 11:00:40 +0200, Linus Walleij wrote:
> This updates the RealView defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - The CONFIG_FB_MODE_HELPERS are not needed when using DRM
>   framebuffer emulation as DRM does.
> - Drop two unused penguin logos.

Applied to arm/fixes, thanks!

[1/1] ARM: configs: Update RealView defconfig
      commit: 56fa6e8a184489b47525488472e9bdcdcb59cd6f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
