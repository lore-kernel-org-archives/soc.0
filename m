Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78368C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:33:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A4B323AA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A4B323AA8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wk+WVfc+iCG/TpVGfctgeUTovtnYD1Kvi1UpeKbQnXk=; b=SG0xzekWENwaqY9u6QdddxaO1
	Nnh7yElZIw8ONjN1wZo9VIBnZueqgWBFeeS74ZcRECcK+T6+JoSdMAJETboW2ijcBalxg+xsnQxdW
	b8AKBssBdPniIgpfNJ1AvUxA87Q1hJhM97beIJiOiNql96OEiLmemHP3JQQZZV1ntKOzcFpPDhspY
	9Oz4qV3MI37ZMSipI1ogA8773H3cQVTATW2yNrZKBvTyLszGUJiGnI4LBQVnWaI/QuqTcnmlCmIWe
	D7OzWwPl1OnvnhJGc+kDqbSNdyoY8V6DexGOmMFuAc8GsHVGY5qD5zGIDHhUzz7N+LLcDWxjOsm/F
	qhJG+nUVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmmSb-0002k2-IX; Tue, 08 Dec 2020 23:31:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmmSZ-0002jk-NQ
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 23:31:56 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [GIT PULL] Qualcomm driver updates for v5.11
Date: Wed,  9 Dec 2020 00:31:36 +0100
Message-ID: <160747024139.3766805.9402422461225342898.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201130190142.345246-1-bjorn.andersson@linaro.org>
References: <20201130190142.345246-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_183155_856499_09D8A535 
X-CRM114-Status: UNSURE (   8.35  )
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
Cc: Maulik Shah <mkshah@codeaurora.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Lina Iyer <ilina@codeaurora.org>, Lee Jones <lee.jones@linaro.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
 Konrad Dybcio <konradybcio@gmail.com>, Evan Green <evgreen@chromium.org>,
 Andy Gross <agross@kernel.org>, Tom Rix <trix@redhat.com>,
 Souradeep Chowdhury <schowdhu@codeaurora.org>,
 Vladimir Lypak <junak.pub@gmail.com>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 John Stultz <john.stultz@linaro.org>, linux-arm-kernel@lists.infradead.org,
 "Isaac J . Manjarres" <isaacm@codeaurora.org>,
 Roja Rani Yarubandi <rojay@codeaurora.org>, Vinod Koul <vkoul@kernel.org>,
 Olof Johansson <olof@lixom.net>, Jun Nie <jun.nie@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208233136.Yt9plBjjhsA8gr01u9OI85iwBF77YWcYDQAYgJd3WNI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 13:01:42 -0600, Bjorn Andersson wrote:
> The following changes since commit 80e8eaab5e98fc013fd4afb4aab1fceeb049cbfd:
> 
>   soc: qcom: geni: Optimize/comment select fifo/dma mode (2020-10-26 10:29:19 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.11
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 6855f7bdeafb7f6997aae2b065eafd8f4b9ca3db

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
