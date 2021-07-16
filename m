Return-Path: <SRS0=r7Jl=MI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213C4C12002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:33:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB566613E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB566613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mo/FeWtOSA3IsDVkC5sQmCXsSUMNJjliPc4oqNWgB28=; b=OYGXH2cXljzg3Z
	ntQFnlqQHe/TexeiSdxb8oeybhmj2S0w3vQiHwPxyM/f3P0BxhixIDllSZ9a32UiBvuqff+j4IwHo
	ceOrEkrqPybzd4FNy1JoqvnMVTrEgnHXTjsj0FqVob3DwEv1ttTeDu4WsOwQc/lC+7hSB1Y/UnO5y
	B2X2I6yd+cME8v52Wth0Wo9B3RGsC7LCKtGMHpaVBORSX84AicCdhzu3e+7jd+vh+jG47GJXpQq/u
	xNt2+xBFfsjHcvUMG/pW/RO4scukoYPcNRRZD5qU9ZkpxEWgUKR2w8AlKDPw2eHbOChuvrvGBqORm
	l9QQbH6FqY7Fznd+pMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4VQG-005KON-Uq; Fri, 16 Jul 2021 21:31:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4VKp-005IAw-Tc
 for linux-arm-kernel@lists.infradead.org; Fri, 16 Jul 2021 21:25:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAC9C613F6;
 Fri, 16 Jul 2021 21:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626470727;
 bh=qIngPEhm4MHjNtQPcXjNQXbOQlWpSU7RLPoWxxjBzi8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=odjcPqjPH4CC/YcEy4n6ASMhm2Gypl9Bs/40amM86RwSV/OnpKy+E9WKZpR1mWtqH
 1Nnl67/iVIE0Ap/X7DVCXi74q9Nnk5nYfmflj+Yv8t/GsFGKx8IqBX7sDL5vORTLvu
 gOwVW9ri9mvoiAR/eWMRGCsxDvkTbJ80ykqBY1RvhArmPqcyQ1pX0apjz4PH5n0A1H
 fy40pfnJA/xkOlTGyhSfOECWD3R912j7NxnHszGdfJALSPI8RBzaZvdLxdb6Ug4ixp
 pfoHkcezXSDkb+VRKAdO+CgH0+AehAmKaiDbxBAXXyHJs6bUx8XirH2VwOBefbBejx
 skxui/526lowg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
 ALKML <linux-arm-kernel@lists.infradead.org>,
 ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] firmware: arm_scmi: fixes for v5.14
Date: Fri, 16 Jul 2021 23:24:53 +0200
Message-ID: <162647049954.3478428.5986159195000598308.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210714165831.2617437-1-sudeep.holla@arm.com>
References: <20210714165831.2617437-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_142528_059644_7FC9CD6B 
X-CRM114-Status: UNSURE (   5.73  )
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
Message-ID: <20210716212453.Zny8QXOZjdL51lejyi1_ZcZUTRXawZI53ymPNwmyO_E@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 14 Jul 2021 17:58:31 +0100, Sudeep Holla wrote:
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 2526112b681b587c469ccc5039b5d5be0ae3b5ed

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
