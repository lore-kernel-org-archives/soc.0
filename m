Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BBDC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:22:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FACE6113C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FACE6113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RLeXsYnyYlenmF1UJYzzRakdLTRYSL2RIC68p+jGUk4=; b=kA8ntsxyJPwFqLxLO84Q9Qk9M
	N2qu2zsHSPJNs6ij4hbVhHJv6A04Bwei54r+9hWv6umArEehz+tmLKraxHJimDPKn0+i8+9a8WJhw
	799AYvchlVSlFmtVombFkDmJNyu14QfvtzVuyJRHzUPPdQWBX8xhcWHh/0zMca+2hedNoLnrjZqNL
	bntkBQS+YD4qUeGgTliAulCO21cPY7+ftX+c/2n5t6nOY1tXpFBsM2o42zeVFZPVcGjQK7TOLc61J
	E2PNmUYNJ2ka1/1V+0+gVIYtei/GoUzmj/SixDomon7Tvw99xAmkqNlbZNqv74+aPrwCl5L/qSULo
	tQBmG/GDQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUb8m-009BxO-Am; Thu, 08 Apr 2021 20:20:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUb8i-009BwT-8C
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 20:20:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F2C0610CF;
 Thu,  8 Apr 2021 20:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617913230;
 bh=P6PT1hQasfOdzBnYgOkWcVty9BPwNuJx/4jTmTi+f5E=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BOD8Kh4OVcifqdyk8l1bHPzPwPl2xmWoUaG0UASx1NIcOnTMDrNPj7K2Ky796reu/
 Hj6YT2cTdn0rmIIkeUlfu0Zg4ByMEIhmce8kTV+PXaCfNhowllzXjWmU+4q302yJ/i
 Dyw3QtwVcx61tNYn9Wk6B8toX70SyHjitzVpweNdwqdvpbjkYBxuKYA39fvv1voAQO
 LCzS7z+Yd7gqOSr6+TPe87UX+GxfHWZ+EyGfP9FNdn6CKaUpEUoetpuqe2OQavecUS
 1g269O/adp0Lb4bxoqsCLdihdQC8CH+bKK0irBn8a8TWRuhifJiJ1CZ/F5KYcf4gYf
 2R1Ku96+W92Kg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, soc@kernel.org,
 arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig udpate for 5.13
Date: Thu,  8 Apr 2021 22:20:04 +0200
Message-ID: <161791320105.1663026.16468860660574153145.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210404164841.712845-1-bjorn.andersson@linaro.org>
References: <20210404164841.712845-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_212032_495063_F32D4689 
X-CRM114-Status: UNSURE (   6.17  )
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
Message-ID: <20210408202004.adat6ZZHH43S1nZk0vf_8trgWsYch1Rp49k3eYrKVCM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 4 Apr 2021 11:48:41 -0500, Bjorn Andersson wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.13
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: d515102f56a02b68c5cc840880b45730736df73d

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
