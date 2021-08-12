Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5240C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:11:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C70960F57
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C70960F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6/qZvCMul54Y8vZ+MVc6nIshDQyR+rpvl/iGxO6O2U=; b=bPuf9hiB6fNxbQ
	rPzjojUbjeRCcNTxcqEBzeQFDFDJHM0RC56h3NK6NgX0EcVBXLlUwMuZuvozPV7Jz5ZXvb1v/HO6Q
	/nxf+s1ia2L8u08Y3fSNMJekxkZI4aN5lT7ldmG/w29wgD/iIOC3L/cZcyiqdtfMIV4332GXoDtBk
	A6jeaiazp39ru5NQKpetv3U2z7NSVtWEMR7kWe3kfuAs/pRT12FBYDB00RLuH5oK2uVemYfnaxY/L
	7/vGysIRTWsqahM3eEMTmrqNu0z8y1FyRQu0qK7A46D4un30ON1C9b8e6BlBb2yyw8vtdVYdhuQcm
	4Uc9dVJf792hI/cMKwFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHwH-00BKSP-EI; Thu, 12 Aug 2021 21:08:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHtv-00BJWu-7G
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 21:06:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2986560ED5;
 Thu, 12 Aug 2021 21:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628802366;
 bh=+2yZQfXZdLsI6A6VkJSHVsxcag02zhr2MFnb2//BM0s=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KXEAOlZLBwj2lVNZ7epZMzDu9J6hnUX8K0bYqO1VBOGwVFPGLDZsv/pI84677VAAj
 j8bGzrsgUPuvsu6sEFdLBEJmBcsJzHlyg/lXG/MsK++spe4IQyqVIz0lkamK3olziW
 eeuWfOj3faDHBqM9TNfrkp8VHfQhS3U4WSmZhN5vC4ScKszmxatkif580Y+a877VCX
 tWPudrwv+OksSWPLd6KQQPzB+ysWZv6w+pb7PvVhT478FlFiuIqoXXYAzLE9OdSBj4
 gH6spko7VfDyYsSFkzqawtNv/6gvHPcG6tTjO4tP+LD1SuvUmVN1Y6ga1WSIx0zSrS
 G66YJYUvtkMZw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: arm64: dts: TI K3 updates for v5.15
Date: Thu, 12 Aug 2021 23:05:43 +0200
Message-ID: <162880206147.1376011.10431613497274194194.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210809130631.pfvntcichsyeekbo@festive>
References: <20210809130631.pfvntcichsyeekbo@festive>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_140607_323216_9FE470E9 
X-CRM114-Status: UNSURE (   8.07  )
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
Message-ID: <20210812210543.mvoOccsczK4pvogaDePy2ISZmHZAzi9Vr-AIEVQUjdc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 Aug 2021 08:06:31 -0500, Nishanth Menon wrote:
> Here is the DT updates for 5.15. Just minor additions this time around.
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 5f49f22db4a82285fbd76b34026051712fdc28ac

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
