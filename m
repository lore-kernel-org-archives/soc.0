Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B696C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:12:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C66E423B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C66E423B16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H/Ce2zwUsL9Qw19agYkbI8VP2Sfg3EPX4Rcv0V9qB5A=; b=Yd2m54L5PJzwwFeWqw2j2e96m
	zstQl8FEYCDWxNc6O/M02N4+D1qzdqGFgs0fj2dJOPogWnjV+Xi6DjsjJz/cXeGPF/iypW4Y/N7BG
	z/b3e6I/KoC3RfEVBrVrtvQ1dw4aKuju0MnvsUipPNYIAWLBW11XSulDvhDBk1icuTyuIga7xUUR8
	7FOa5lkZRmWjGcXEJZyEk95vQ2cxW/H++bvR++Uuv4kZzBWEtpcWC5ftzyLemPEnOAkw3akzxWcCx
	Y9CAWIS36vDhySCfrQBlFs5QXLFnIQYclDEug5JKXz0T1a8FZpxhxL+6wseQRWRLPqtDW7uZNiOwm
	oFsu2VBzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmm7l-0005XN-Ga; Tue, 08 Dec 2020 23:10:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmm7i-0005X4-T1
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 23:10:23 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 arm@kernel.org
Subject: Re: [GIT PULL] Qualcomm DT updates for 5.11
Date: Wed,  9 Dec 2020 00:09:37 +0100
Message-ID: <160746884645.2839681.14995823048779757399.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201130190148.345302-1-bjorn.andersson@linaro.org>
References: <20201130190148.345302-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_181023_241045_D503E3AE 
X-CRM114-Status: UNSURE (   8.49  )
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
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Kathiravan T <kathirav@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Iskren Chernev <iskren.chernev@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208230937.38Gg7JpUeUvjp21nmkKZnh6VRt2hl8Nu-hz2r6GF9S0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 13:01:48 -0600, Bjorn Andersson wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.11
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 6ce23595b587a4cbb9f14cebdc20de4336f95473

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
