Return-Path: <SRS0=NLw9=NJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37FBC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:37:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7510661058
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7510661058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fL9CtqcIduRxvtwVPp/LnYkhMzX/V+jcMz7ZVSZM36A=; b=ZUPLcVdP2K3cji
	0m4OxE4nLi4rqp+oZnYywr8CaLtsgQYNWmHHL699npvJVm0aHXG+YqP4+uQSdbthWEnCx3MUsY0BG
	uPlumGjUe2WZNlDEyt2vI5usASaLA8sYCZdGMB57Naz020gFr/2nxtS6Z+O668TJqXpA/Chn6rFuS
	2UWBlly6RU0tw7hSM3mtLO76n7rn0dtEolS5d7xnScc2oBKuozbldlk0rA4wYcC8uBnMksrtncy9F
	c4gW6khJcUD5vkLkTBtT9rJGEd1Uv7btsBMJr7jGoScBWSAhB8LEdoPNWiYQtZtRxo4uMBvuUT/o8
	I9MWfDYTuLeG0Gkv0BIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGLj1-005hoK-VL; Wed, 18 Aug 2021 13:35:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGLiV-005hiM-9o
 for linux-arm-kernel@lists.infradead.org; Wed, 18 Aug 2021 13:34:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94C21610A1;
 Wed, 18 Aug 2021 13:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629293691;
 bh=rwRK9crQJCVnHKW8vkrj5lMxrpEgI49GLjIfAm0Rpuw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kq7hrYdtnmlJuaZIOyujyeJ5oQ8E5tQ3THqFoe65yzI529W1oT/AgAPWAKXuhH5Go
 hk6a5mGmtVXGBFFMkPpo7tFZ2SBTWq5nQHUV+WgVxbaA0ah5B9Wm8q230vQmtX/JFq
 4yxLiYM6e8Dpj3p5M+6dZhja89Bx+5dVCg95QdMFzCfMyho9Y79DPHuMZWWOrrQ8fP
 Z+8GeauG7KHFEdHznfGJetrQbLVamAClJbj+cM/aQ6nQC1j7YS2JmB5+aE5l2qUKRm
 bqcqUTut4Wk0NiiKva6XjD/Nuew1Vg41QzrcQQM3ea/zZNIdQxg7weMsA3tV5rqpIT
 DgXD96KdvOJZg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [GIT PULL 3/6] soc/tegra: Changes for v5.15-rc1
Date: Wed, 18 Aug 2021 15:34:39 +0200
Message-ID: <162929367315.377646.14938708321715472898.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210813162157.2820913-3-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
 <20210813162157.2820913-3-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_063451_414908_47B5BFA5 
X-CRM114-Status: UNSURE (   6.89  )
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
Message-ID: <20210818133439.7tvfDoYga73CoNVZUi-gwizZp7TZlQb3_qwOHWP6A8o@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 18:21:54 +0200, Thierry Reding wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-soc
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: c4361dee2e6cffa32122e06c9df0a9c2e5c4dd51

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
