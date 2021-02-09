Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E3EC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:08:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 869FC64E50
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 869FC64E50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MkYEpIZfC/HKzViJI7aKDumTpKRxnePt/qXdoG3NKxo=; b=dGssMGz3Iq7o8HYdKRESqDsDQ
	Qd9Em83h5WG2j+lPcXdoloapr4G0Q6PV1Z30wY0e4TyNtP3FJLbzpEikRnrAewlvrdrPWBnRfYLQh
	hCBUENHUR92O8xmLMZZvPfG4DiD2NaMDCLySLBPf+mc2NU69Twx8GMmM4whrDQ23dLrWPCds/EhXa
	bW3QZNfW6i8ZBBrB74daqS23qvDhSc2mlgq6EsroPy2igzphBJAfZFvKfpez6rvol/dnA2bBC6+0U
	mp9g8b8xLhn2CMJc9jqh84nXlQtI2USQomLTiskabH4/y5kXQnR/QDDbkdJn7LSI3NHWY3G8M7RB4
	C9cZsX+wQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9c5c-0007Fl-DY; Tue, 09 Feb 2021 23:06:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9c5W-0007Dx-TX
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 23:06:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3C5064E37;
 Tue,  9 Feb 2021 23:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612911990;
 bh=+4xvOTWxhTit0m9fumxstBEea5khx19cdFunJqf2eFU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZNO0THcE1qAfFrP6rywrovWOHVialiqFJlQiBKZ9PxX7DZGDfAuiDcQwXw8WPlflD
 eQx+SJNwEYpPN+dElBHJtYtiFmbhm3EvSDhutbEPUhUChzhZEazvA4QHFlBQO8yiSG
 gNTRNXhNHWiAirVZYdZ5+zrXvcuSh2zTMH5amTEwxoMd7gPGzs+JwIRVaeWMpXCH8v
 REA11E7bpf1Vq+XGBCL977cg6NF6DG6O1J/YYA9TNhsAzfmL8W8mqC5uQ7Lc91OnKY
 ZthbpqzqwOe8SoBF7KtQBslPnXiGhVOsIYetILnffoYPeCh9aI8H9xUQKrLwET2OpO
 5Vl05TG+AQiBw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, soc@kernel.org,
 arm@kernel.org
Subject: Re: [GIT PULL] Qualcomm ARM dts updates for 5.12
Date: Wed, 10 Feb 2021 00:06:05 +0100
Message-ID: <161291108067.974605.8857529097964625504.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204052320.388999-1-bjorn.andersson@linaro.org>
References: <20210204052320.388999-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_180631_093116_D654FA68 
X-CRM114-Status: UNSURE (   8.62  )
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
Cc: Jonathan McDowell <noodles@earth.li>, Arnd Bergmann <arnd@arndb.de>,
 Adrian Schmutzler <freifunk@adrianschmutzler.de>,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-msm@vger.kernel.org,
 John Crispin <john@phrozen.org>, Samuel Pascua <pascua.samuel.14@gmail.com>,
 Olof Johansson <olof@lixom.net>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Iskren Chernev <iskren.chernev@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 Robert Marko <robert.marko@sartura.hr>, linux-arm-kernel@lists.infradead.org,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209230605.lvK40ILCfe1CIb9zuKOsd6UZGwpjFdjw8BZGrVEKtgU@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 23:23:20 -0600, Bjorn Andersson wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.12
> 
> [...]

Merged into arm/dt, thanks!

merge commit: b7976dcf363be984b8a33242f8e6b3b196f9c329

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
