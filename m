Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D88C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:44:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 226BA610A3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 226BA610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BrMxnABVOcrU5nHhRP0DZ4Oany8UzY2lUhtCeSuldJ8=; b=2NwZUwwZSM4tHG
	smsxgi0yZlu4WYQbPL5qE8VZKZ51Vd1kti0txs+H3MbOaK4OMTXzpg2Vf4VS9QbyvMWlysC6I7sVe
	vipnNK8YkliLFX+iNo7RTdFvkExz9KTI1Am3IuO9eP4DQpmHYDs9Aoo8QiC1JfPdE2hc+J1vL0Xku
	aQPcsFtbSEoKbzN5+7enkmw0kpbw/ssYoZ7oPCW50feuDVMOXiOnC2z40iU/t1zi/HWMo7/u4tzbK
	o5uDH5puWe2GCVGC6HEJwQpskozi+iSMcipOVX0Ocq8VlJL4tUm6QMa9QyIqMknHHxBBXelGVlwmd
	5pjqKeiftbMxU/zDLKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHWG-00BBNR-Kr; Thu, 12 Aug 2021 20:41:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHWD-00BBMZ-8o
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 20:41:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE4BD610A3;
 Thu, 12 Aug 2021 20:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628800896;
 bh=7oRSYR5XXc1fs9uoTljNkjs9LQwRhwjQKrprY2tkjH8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=or++Sj+XgZ3bvZUzACSh+09MONBDX/RAZQ114pJUJ1L5zfaue6zLibAIUrgCDQ5Fj
 T6KaIehX5Smvyfga97Wh+dkxCzjIPedCES2p4ZHWSt6jcHTCTCS48EdhycAZHCYHM2
 m9OEmObEzGAk7KqHb4E4Sc5dsgWmz1MD2L4U/ebXvr/Urm0Ul7nmD08D5TAc1WQKHV
 d0yqwuh99fCwQzISt16kai85DdHAjWF/W4znY4X+0iwRhr4FC++eJZj45iwX6GJSHO
 PH24Ufz/7tEWDx8bPJU6l35TFfXFIIYZ1q2Iz3gH3u2devo+lf8Onj0TkkyvQ463Oc
 t/CUxRBx+5mmQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, arm@kernel.org
Subject: Re: [GIT PULL 1/3] SoC changes for omaps for v5.15
Date: Thu, 12 Aug 2021 22:41:30 +0200
Message-ID: <162880088338.1372369.14302259325676706777.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1628153040-834155@atomide.com>
References: <pull-1628153040-834155@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_134137_369143_C1074F94 
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
Message-ID: <20210812204130.mk1NTgeEVmvQsry3zput8dn0Yk80bnU5vS2BbjBZDOk@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 5 Aug 2021 11:46:42 +0300, Tony Lindgren wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/soc-signed
> 
> [...]

Merged into arm/soc, thanks!

merge commit: c8d9a986d0f2466d11ffd07e66fed9f4a34631a7

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
