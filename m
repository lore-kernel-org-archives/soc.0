Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C886C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:20:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4590B64E50
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4590B64E50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8RQdoSJTwvc/FBszNtZf9i5pnH8chT9dD0x/AQrp0F0=; b=1waNIEw+R75DYd73e5rK4pIth
	1ilrVHLu7wYf0y5yFHZ3bLWFeDk7RIrAzEORzJN8v5EKnRKT0SYWtS5lGqqsi9vR2pvIVRglrdBTx
	qjH7L2tQJ7O6pqaUuuBvJDzzYTdU6s4SAO8s8S0Btf5qRD/qi1mS8NX7WrxBihOT1VOnhrALtHqS2
	NQdkhzkjUyPEHBUm5dsWyciHZPvC4yROr7r94TR1GdMTuJTUsCBQSFNn4ZgvmY316qojwIIZRlaYJ
	/ZQP+CP0y/13YWzQiGDpSUkwMeTK1S3P5cJ+EQo6MyWRfEhcJltPbyTTdcMPOLceADkzldphTFFiP
	ZCgT2VIRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9cIG-0002pl-3M; Tue, 09 Feb 2021 23:19:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9cID-0002pN-Du
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 23:19:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7CBD64E3E;
 Tue,  9 Feb 2021 23:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612912776;
 bh=bEdAkSwCJxFLmXKzkXktJ9JtWQpqXjUOCkgYjRyloJ8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h7UryQ4qZBGHYUH4H7ZjF+ZTza/Tbr2hE0PkNAKteCE3TrEluCx77/t26GKKO0W4b
 B/F9DXexEDdBjl3hZ0Y6P8Ofpn+gMn4M7mtZSDCBNqRiP9zzSV70A3q5k0oeiqRHjt
 BV4va0JgWQ6NL/aASutO7tsc6KsnOWo/IkANpKN02Gw1oEgHmVAc5cIBShDVRp6NWQ
 ZHYz+7F0mnUJXZf8FTweUGcK/zNA9Tb8NFEKQDR1BwBhr+JH0oEcTNcG9ZRexh34Wm
 Go0GBnBXBfYqTWTYH49TglcYmWR5w3fWne5kp2cJf82u5itE90VpLhbRJtQLssPG4A
 DnNGVkNau/m+Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [GIT PULL] Qualcomm driver updates for 5.12
Date: Wed, 10 Feb 2021 00:19:08 +0100
Message-ID: <161291272313.978640.4442336684772475191.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204052258.388890-1-bjorn.andersson@linaro.org>
References: <20210204052258.388890-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_181937_554553_C2E3A97B 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Konrad Dybcio <konradybcio@gmail.com>, Lina Iyer <ilina@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Luca Weiss <luca@z3ntu.xyz>,
 Olof Johansson <olof@lixom.net>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Colin Ian King <colin.king@canonical.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209231908.e1V_BGvbv7ba08IsNebJ6mvz3blb39RpmCUJZ9mIaQo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 23:22:58 -0600, Bjorn Andersson wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.12
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: ce8ccf21c040cd1d76f8c16c5cf67e4bc0d8a06f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
