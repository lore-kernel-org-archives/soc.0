Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A440C4321E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 13:56:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 211536023D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 13:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 211536023D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TmUM4rfy8WPnByyblZ05B8B+M2zE4Qk8ZwYu7oHvN04=; b=3L0lKMBO93kLNZ
	2G9u7MCSDOvHDAr2ZNZpwp4LdEqZxaPTGOjOA5eUY0GmiBsWf4GmPwppcaTTCU3KtnlqfV1SVcW3w
	e+2cNgGOFsOBHcLmTjyxSvP3PAmQi/vHxpfhVW5DpvHzylL7uKqdMb/7Sl9K2tcw7SIZwWU566lZg
	4S++tPe2hUNa44L3z84QV8EjD+DaIUImxVCjL9ZsSCDcD+KN4Ll7F4z6FqXtsoQnJbXB/KC7WGw5b
	RCuTBCKXtu3Ku0G/Vy0zLa6qPq0DM7Rpkw/LRAfYyZVwtv3lMK66Ui4APfqtOP61rpbcukypLGR54
	yxHOXr3C3I7EvKAara9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXktt-00Agwg-KC; Tue, 05 Oct 2021 13:54:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXktn-00AguK-I7
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 13:54:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26EEE6023D;
 Tue,  5 Oct 2021 13:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633442066;
 bh=QRyqinl4PMVbQ7Hm9SGv+YX+OH4lBkNZw8ZzZOdgDPo=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W/pPxagP1GNPp88nx9DJ978vOtGm3uQGgepzF/mt3AbpA0quFJS5lv91PfT6ZVnpM
 ISlBXjPnNrZkMcpR2JkfNdamOk44ZD5OhbF6wNf6ueVr8FZhMCreoZcXuFJfhvRNJW
 cFfBQMrGKgEQ1XmqNJRbSb+/ENzgn764vR1V7bVs3kohr/3+WDKZJXWmRRfbMGY66/
 mcq3qxlRsVWjsrXcLwdNiVyfGuHHbCP4JBWqOhpclnkObHeT4gJaLTnA04hzO/nVfN
 myjWaE2AaBe/5hOj7z59KjcGC6p6x5bOO4TgAF7izWVq+MlZSZkp9aqiOsfkjjQ9tC
 usOCqmQBpBIag==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, soc@kernel.org,
 arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>,
 Andy Gross <agross@kernel.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 DTS fixes for 5.15
Date: Tue,  5 Oct 2021 15:54:21 +0200
Message-ID: <163344201899.2721334.537065914671320241.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210930025509.1091-1-bjorn.andersson@linaro.org>
References: <20210930025509.1091-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_065427_651460_C8763AEF 
X-CRM114-Status: UNSURE (   6.91  )
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
Message-ID: <20211005135421.eGA2RuxsVKJtcUUB-WRL6bUCWKhVj9EfbBoFj23F3No@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 29 Sep 2021 21:55:09 -0500, Bjorn Andersson wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.15
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 04e0ae8d2b96a3d992e1024b215071c61e45512f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
