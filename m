Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C85C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:32:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFAE464DDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFAE464DDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jS9uQ6esaHVr9XLW1Lj9UR7RmSI09rmlvj21laeXaw0=; b=fOOa87BpwNTPE8g6F1iU1GI6K
	YZwk/kbaktg/exP08kMd6/olJbN/GvslF1zsAoulBOrtp+uy1P9yx+F/O9HOqkqnoIzPSdT/VqUSl
	oFqUV4YzN5gyqHkufIVM3FN5UPUS9DMcVnRBdxQUeB22720QkUr0htSiPVMphhlWzoU2EC0HAAsP6
	JT2Y2f+Rq/Cjw0D4xSI08R+ZtEwyDxFMXvvv6fjlJRpLbitKfWQaHNWZ+GtTWyKvA1MuUIVOphomc
	9Ii/ntQoBlRH6rQJmAp5kq54nZYmEuAtS9TJmhQwhzaqeGyo+ZKHp9mLH2/vxzwKsWoUSOuJ5jpr2
	9VP2Mbj1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oT7-0008VM-IE; Sat, 30 Jan 2021 11:31:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oSz-0008SY-2V
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:31:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4BF764DDF;
 Sat, 30 Jan 2021 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006260;
 bh=/A7V7n3yMz5TfIqHtRuoIkTq93H6Yx+JtQlz3ROUMn8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uF84PjEUuJ1xteMTgadizJz4gvwYpSI+hAxcGcp7oJsA4d91uJxNlIQMxGDWg894d
 8h8lqCbi8BPI7WsODZZ+X87Nwe/xGDmtZcP17z6ZVXZcOIoRMR09Di+P4SJCuzN2zL
 cNbaa0UvqpIpo+FCbWFxnFMu1z0njcwtMp+Ls+lbm+bBjGKDW2E6zmaNKrLfWCwnfX
 wV2P/hhy9KWlU0Nkw4DVTwONdj3kRYTN1AMJQEUSWbVfVLQ9fYeQ2kBxNBc0fI2+US
 DoCF5RjJcw1kKOA81vaC0pINsIUDAEYCluWfmoxXR4FOphKULZawrqj5w//VK7pGME
 8tw0mcDybQLsg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, arm@kernel.org,
 soc@kernel.org
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig fixes for v5.11
Date: Sat, 30 Jan 2021 12:30:47 +0100
Message-ID: <161200623000.2192465.13870148872058315331.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125232412.642834-1-bjorn.andersson@linaro.org>
References: <20210125232412.642834-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063101_233166_F272F099 
X-CRM114-Status: UNSURE (   8.53  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130113047.lf_lk09em3ESEIOJEi6CZMD9w0epCFYs8ndXWgc_Qd8@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 17:24:12 -0600, Bjorn Andersson wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-5.11
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 082153866e6600e37a98d6fa21fbc347fa22f6a1

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
