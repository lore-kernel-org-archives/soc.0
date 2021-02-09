Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54747C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 15:15:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0043B64EB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 15:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0043B64EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZuOTQyjCPB0zF+HgYJ581w9vS4/zmQNGD+rtwph+72c=; b=j7UgN9M/4AzlXSYwEOtAA0EIW
	7ee9VOtbOkH37fuvNuEaDl3TS63YC4Oli2JIVa2hWY+/6E4UHyfIQI1JNirOlDH3SYydxTGrdwvsm
	6dpy7ASnWNewOWhDBvV39IYTW+GugTRNTJKgkFdDy5plC3+8gCvSTUjQ5wkvZE3eJNttO0URbuQ00
	VBvxf+JrNGclVzPzo14+MfE7VBacSVzxXsomyXPsSq3D6ZJZq7eQkQgSRZ5c83k6dnYTPj07i9o/Y
	SccDY/ogHg/d/j5BOj9OeLVWW+Kr6D1Awt7XcGiWByy/fJbE66QKWbkJzYWZY7DJUJQAOQjoodT9/
	kb8tiVaiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9UiU-0005Ex-N8; Tue, 09 Feb 2021 15:14:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9UiM-0005C7-8O
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 15:14:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A22BA64EBA;
 Tue,  9 Feb 2021 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612883645;
 bh=tW5KZER/roH4B6SBzwIkRa6JCnEucXcKBwFZvpiPcoM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z6N2RXXFcnfGHUeV4Z0cu+hBil8Mitalm8Ibj9nMFw+H5FEdKdi/p+hJE1U+STHrW
 ZgLw5qQDd8du3BDtoMMFzqiN5MgDmfKN8FMwihnz/rPl2zC+/vxSCFPcnRMXpY7BQ4
 XXMJxXn2YCVQPQSV4nGusjEwPxo/5DOZkGQEc70yvvZnfNuX9/cKAGGLbkTlIIpeuJ
 ffC4C8qz6NfcSDiWIn4DaiHlO+0IDdKxiqhc/ctKutEJ4Y3qBaT52bbwZjIPGaU+qI
 1xL2ds6Tipj8xKWG+XLnrWuJ0+IgYDzyfiA27rSNVdHmaelfObW4xG4fCQ2voJwLzO
 eN2e9WUPQBC0w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, arm@kernel.org,
 soc@kernel.org
Subject: Re: [GIT PULL] Qualcomm ARM defconfig updates for 5.12
Date: Tue,  9 Feb 2021 16:13:52 +0100
Message-ID: <161288360536.2910447.17395557874947712257.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204052236.388783-1-bjorn.andersson@linaro.org>
References: <20210204052236.388783-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_101406_402439_9B3D2170 
X-CRM114-Status: UNSURE (   8.52  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209151352.alRmGPIlWdlKSzfW66ccBu5gUM9miOTF4o4Y8M1SuBI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 23:22:36 -0600, Bjorn Andersson wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.12
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 7321ed736f5c4e7fd1e682c93b73db2967e10ea6

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
