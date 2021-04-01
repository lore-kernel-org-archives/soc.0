Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6F8C43461
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 19:41:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43F6E610CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 19:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43F6E610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yw1h4twVDFS3UK8klOFwoxIQ62HllGdgG6XFDoNIxf4=; b=fgdvs+aZWFBD+h5ngkt9PDN5C
	4MDdY7zMaIPiMsAiYt3deoCicPgtcy24T4r84EK9FNTRWitUg+ISXUlZrZAArAij+DoBjzBp/rLMe
	oPxVIADWe0WnrjE6VgfH3Yeg3KlA9qb78OHGxM8KZvAOyPzsXhXplRY+9+Doy7vXuIAeme1lnSAlI
	lzBDADA28z+61A6ydFJeReGLTgcqBiPvHbmzd+mkwz2JISBL8+BhQbDJQjDxcBwk1H2PpOku9SWoh
	bGLsaxfjiDZSGQjXVFmatfGt7o0VLksa/0zt7ehvXNn9yChJC4hnjVb4aNAKhkCxOD9FCllQdZTRa
	XIdKFO9Bw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS38A-00Ao65-P7; Thu, 01 Apr 2021 19:37:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS2vb-00Am96-9O
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 19:26:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB654610A5;
 Thu,  1 Apr 2021 19:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617305063;
 bh=y4dKcnGnV+jd4LSVkwIniCXTDonRLqPpBczlpm8sm34=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MvpgvIL9NMvz4ioZ7qRXhUuFt8fsJcVvAhMuf4TLuUcH0KxsveuYc+Yrf6zhgW5rU
 ws7CmN70uVe39REsVYjKrw3L3gZAUnIVUMrfsBNPMxq5EkJ8gNIF64z795EYVuNg+8
 YsGJa9DzLe/Ns0RE45GQln1lgU3gnC5yS5yIRY70y/FulfMB5ADhcRkKtSS0pV9geB
 mjU+C1sS3Ww3eBhezez+vs69SmGVhF212GhdKjNZgF7qOVnhhhsK2ju/MhhwXgHDLV
 uqB+wZQoVpmuy4FR7zBBkLtLayrjwD+spcewMO94AubV534hWN5/ieeJloBjIQfjuW
 ziwiYlwOjbVOw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, khilman@kernel.org,
 linux-arm-kernel@lists.infradead.org, olof@lixom.net,
 bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Rob Herring <robh@kernel.org>
Subject: Re: [GIT PULL 3/3] Broadcom drivers changes for 5.13
Date: Thu,  1 Apr 2021 21:24:12 +0200
Message-ID: <161730504496.632809.4121560040129719627.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330184006.1451315-3-f.fainelli@gmail.com>
References: <20210330184006.1451315-1-f.fainelli@gmail.com>
 <20210330184006.1451315-3-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_202628_876335_4B3BBC64 
X-CRM114-Status: UNSURE (   6.67  )
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
Message-ID: <20210401192412.1vxnD-jqlHXfKRSNl1nNUaflblq7zyuIKC7FfkVGoQc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 30 Mar 2021 11:40:06 -0700, Florian Fainelli wrote:
> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> 
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.13/drivers
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: e9396d6b3864d235c57733ccb4902834eb8313a8

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
