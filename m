Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78671C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:24:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43E3660F11
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43E3660F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRuZE65WiyePMG4eM5DCPZ3Z7dQtdiypmu68eDcMQbc=; b=t+c63GyjEo86+B
	L5/rzcRnMK9MVDCItUVgFSo+OTEO6jPmwVp1059ES5OYMUvK/CgbupwGUe603NY1xDrgVMYxaPG5Q
	84PVpBxyZW57NiZFMpXK52zPcQUPr8QAc1JPcWZngzrr4jxhIGBXFU4yVJ20kcspwlTAjwi4Z0F6Z
	7rVKQhGBH7xeelACSCrBjzG8Ya+u+s0kZehhyDwne6zZCaJtMRA6BkIv3RsrpBXGwtosoI6fZ9pJX
	4XBCche0toxsgaPe8H6VnN0v804SVu1sv4PmFnm+ixCjJzyfxM21AEYYaal97fTld1x4/kkRtkuAe
	4OsaU3XTftA7OETzlE+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFk4I-000L4N-RY; Mon, 16 Aug 2021 21:22:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFk2e-000KPy-Jo
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 21:21:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC64C60F46;
 Mon, 16 Aug 2021 21:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629148868;
 bh=qCFAHVCLRijxdHcCRgP9+akPfqIuc+pSwHcMdU1zdsg=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vDqEIQ1IcZn9OnwFNvDA7GaPCrsNC+3mfNv3p16+ZGlC5dLtaHY9ketayQjPe2r14
 Q4Ax6hm2KW10C/GcFIuK3+0RSdd36S13eQEYimNSgAr1sjh04nzGF73RLFulUHG/DX
 9vmZ9y3gKPi7aAJkJE02tlGpq9QoBnNI2Y30uDRTwNW06ma0X9NrJfbtwuKP25xbVv
 hnGZifyDqPfSmWU9WpIs1wO5X+jr4ufXuYBpBKExrw/6qO5DRf/ZXtoMDc6eXNzR1L
 CKvM9CTx4gQXtt9xknZ6OmTmy2zoWMVCwneXWNPnHCuwA6HkuJXZCmcBQfRnIGb+oK
 kk4b10q16JyEw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org, Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL 4/6] ARM: tegra: Device tree changes for v5.15-rc1
Date: Mon, 16 Aug 2021 23:20:53 +0200
Message-ID: <162914852247.237905.11712885319102863319.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210813162157.2820913-4-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
 <20210813162157.2820913-4-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_142108_771140_715246BD 
X-CRM114-Status: UNSURE (   6.42  )
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
Message-ID: <20210816212053.BdmIPtECrrNDWlBavpxKObnAUUBtgVD-k2S61qxFF7M@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 18:21:55 +0200, Thierry Reding wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-arm-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: aadf2b3857ad1d09fb28f08058a746f04698f81b

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
