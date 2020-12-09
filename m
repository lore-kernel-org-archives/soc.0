Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CE3C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 02:24:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44BFE23A53
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 02:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44BFE23A53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5r5t7/R/JRa06IyB33NdvQJYv5esP6ohW+O99ezXr54=; b=lu7ZSjqFebZx+B89mGvPnyJz1
	MCTM+CKNlQWI2l0YzS+gIoQ7jkXECUBkeK5Y1Xv8s+NKJTPg3opEf79W/OgONENURtlCGKQCGd/7t
	ut0QlU2KcZwM9DXgyczU+m+TaBVXjIt17Bv6209nKkDvydkJwfHk9psw7Xvy0N6US8OdGR8iAxWax
	TW/x20sIyX4FZZrEZRnoZMHAqYQeTmHljVoyAb0H23h0A8EXWbm6EuVDFZ/duIfmPU1Xu04UBLFPd
	ZPOc6qtlSihUzyIDMPGbMiXTPieRuEC40G57xVlN67EyAfJB6Nn3WKFVwaky0mBxsq0OOR9DKZLsE
	aPCN58ZNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmp89-0006Xh-4z; Wed, 09 Dec 2020 02:23:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmp86-0006XI-MY
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 02:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607480577;
 bh=YLtysIEwVZnL6MwkzlBFAOiwRSJilA6/Rvv2sqLnSbE=;
 h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
 b=GKaJ/aOXo7UtYYKSjhgw41n8kubVYfDm2kRfkNiX/rQiR9EmWwnc9TPlc3S0QZ+Ts
 miRxmJlBSpcbdfAhrgLGCJ2rQ3LBKQ1wablzV+Lx8rEYS0uXcnodx0Nn2ezslYCimY
 pe9KcHRibCFEqguwGudiC25PhQIRKBqt91b2igdbMnuULla1DePHfnj1rT00XjRo4G
 DxkhNEe/gaFswtOCPR52fjrDB5i2Q+l3zpcLBcP7hW2lUMT5y+BTcAqi3ze6woLIO+
 olIUiNH460fUJOF980A1qJVPx6pN+5YA61t2SZUL1yR/H6YJLtGy+LtPfpmtwHrP3n
 rHnyKUKbMh6Mg==
MIME-Version: 1.0
In-Reply-To: <pull-1606806458-694517@atomide.com-4>
References: <pull-1606806458-694517@atomide.com>
 <pull-1606806458-694517@atomide.com-4>
Subject: Re: [GIT PULL 4/4] Remaining genpd changes for omaps for v5.11
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>, soc@kernel.org
Date: Tue, 08 Dec 2020 18:22:56 -0800
Message-ID: <160748057621.1580929.5548911592835257040@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_212258_815431_D49669D4 
X-CRM114-Status: UNSURE (   6.60  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Tony Lindgren <tony@atomide.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Tero Kristo <t-kristo@ti.com>,
 arm@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209022256.h7HTaZO3IEzKUWOsht6362O9tvkuwzlBjsiMPjhvk2c@z>

Quoting Tony Lindgren (2020-11-30 23:18:49)
> 
> The changes done here are:
> 
> - Clock driver needs idlest check dropped for IVA for omap4
>   and dra7
> 
>  drivers/clk/ti/clk-44xx.c                  |   2 +-
>  drivers/clk/ti/clk-7xx.c                   |   7 +
>  include/dt-bindings/clock/dra7.h           |   4 +

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
