Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82516C4167B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:12:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41A1823B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41A1823B16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GcNApZ0AmufnryGIOxP2GDvCD3ZauEJZL36ONW9E5G4=; b=DhbJwJIAv+Rr1oidiUdxsou9M
	oq3vlOKsJw0JlTxF2GOMqKTLCuu+8JmlM7pZpyQd/SFSTIWcl3cBiw0OIczHusttTYqm46igGUzqb
	70oAoea5mFkr9B6tcvxh7NVTQ64GJvhc0KZT977a41Ba7P+uT/wWdiEdLEnDc8FnG2RjJzvhJlgpZ
	mYEeOQoXgKkrM4P5kGRmy7f6dO+bXeLI0VsTuxjJilK536y5vOUMXldj+wXZaKrKD2jm1jn22dXwG
	WOrq+F4HDp12AQuwefl49OQOUYRYFHz+FPqyJbYdfeN13+kLQn4HJlHmt9FR3+J403IrUypU2QN+I
	8ML0wq8jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmm7h-0005Wr-39; Tue, 08 Dec 2020 23:10:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmm7f-0005WY-FL
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 23:10:20 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 arm@kernel.org
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.11
Date: Wed,  9 Dec 2020 00:09:36 +0100
Message-ID: <160746884620.2839681.17580415072842947702.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201130190131.345187-1-bjorn.andersson@linaro.org>
References: <20201130190131.345187-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_181019_595495_7B8BC8E4 
X-CRM114-Status: UNSURE (   8.58  )
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
Cc: Taniya Das <tdas@codeaurora.org>, Jishnu Prakash <jprakash@codeaurora.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Kathiravan T <kathirav@codeaurora.org>,
 Antony Wang <antony_wang@compal.corp-partner.google.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Nikita Travkin <nikitos.tr@gmail.com>, Matthias Kaehlcke <mka@chromium.org>,
 Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Marek <jonathan@marek.ca>,
 Kevin Hilman <khilman@baylibre.com>, Konrad Dybcio <konradybcio@gmail.com>,
 Evan Green <evgreen@chromium.org>, Andy Gross <agross@kernel.org>,
 Sibi Sankar <sibis@codeaurora.org>, Alex Elder <elder@linaro.org>,
 Souradeep Chowdhury <schowdhu@codeaurora.org>, Terry Hsiao <a804335@gmail.com>,
 Alexandru Stan <amstan@chromium.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Srba <Michael.Srba@seznam.cz>, Zhen Lei <thunder.leizhen@huawei.com>,
 Ajit Pandey <ajitp@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 Jordan Crouse <jcrouse@codeaurora.org>,
 Thara Gopinath <thara.gopinath@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Olof Johansson <olof@lixom.net>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208230936.r1zPEjY1HQLu2irmIlVGoTD_dJzDBP8ogzy12yVfn5U@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 13:01:31 -0600, Bjorn Andersson wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.11
> 
> [...]

Merged into arm/dt, thanks!

merge commit: a39d2ef78d44d79ed00fe9256b30c0de1a61d0af

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
