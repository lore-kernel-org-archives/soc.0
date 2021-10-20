Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615A3C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:05:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C2BC6103D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C2BC6103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IjWegXXc8PC9G6LzAao0OG5MavkwwsEb9ndrY7B/9M=; b=2a8HXbQBeggO9D
	32nY8VBleT5cg41gLuJMk4EZnBYiVVroAmG2SP6ow/Ci85rQOE+cLQ24OBoEr2YNPmEKmAevtkGuu
	sFAeKHUcyeAvMnVu4QyytzUyZRkX2W/JPEPAiPzU2z2S5ot7t6APe8qePD1VYcXqWo1gB/OZ5x/sH
	alZ8zrjoxquwDG6DEBpLXUMwFbZzlYaCrOb9VZhikWGUNp6M2wcFKWu5eELyQc+go/55tAyfig8bB
	s0fmrfaauvOfR3GNMfEQzw5sEhG8TSXbnn3VarPh/Y76HIlcDVwMaWgRJlUshcPC+XiKRrKRSvaTy
	IFnmK3IjBvFsBu6fFCMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdD8E-004tWo-Eo; Wed, 20 Oct 2021 15:03:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCvS-004q1u-7B
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 14:50:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1155B6138D;
 Wed, 20 Oct 2021 14:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634741441;
 bh=u7zQWakHPBtcuf6nifDU5I39hgpEJqhYXxITmxy9U0M=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q/IPhTeT78/LU230wy32aOSli0tySh4czSe+TrU65uPBcV5sxMLf/Ehb7+mFiRqfO
 btpjj7uzVKD4ok9QSTo7LzA40Cx5c4O4CRmiMSY/9D3ESBXvPnrydzdq4l8YgAaJ8K
 M3Swq3k7S56oXE2PDmwB1aKztacCteojBwCV50IBB9c5Xixe2aKnQCs06XkmiqSi67
 lfIUpf3BAyQ7Lr0ptI4DoZ0LFfyFyMhnj829W1ljNaLt+zPT4HLIOSbRVGwPRrtcb3
 CivIeSLzY4jTu0LVkIw3NCTKNEsA7ydTI7YVpTqer528FVHlNQ6KkX5BqYc9MVYEZa
 OsIAfKSThzjVA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Olof Johansson <olof@lixom.net>, arm@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 2/2] arm64: dts: samsung: dts64 for v5.16
Date: Wed, 20 Oct 2021 16:50:14 +0200
Message-ID: <163474139772.4099414.5704617411027385317.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211013162418.43072-2-krzysztof.kozlowski@canonical.com>
References: <20211013162418.43072-1-krzysztof.kozlowski@canonical.com>
 <20211013162418.43072-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_075042_359154_A5803DA4 
X-CRM114-Status: UNSURE (   6.75  )
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
Message-ID: <20211020145014.ga_8zOLWbCRyudomeBE0g0UW3yIVgtpmYbX0ernie1k@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 13 Oct 2021 18:24:18 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.16
> 
> [...]

Merged into arm/dt, thanks!

merge commit: f202bd97c6893973ea1a12918125d70fe937d45e

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
