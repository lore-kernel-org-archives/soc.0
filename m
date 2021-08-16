Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B93FC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:36:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 019A26054F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 019A26054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A/B4sqq64pxiogLh9ldl/sIShHAVlyqzQYLfKndrfDo=; b=gKMYK3CkqjhcMA
	u+aYYZgW7nS9B2W2eOxUZWXMDHqHrGkmH+opiPCYAh+ismYwK3yuQc/aeMn7g5O1lPPdn8gK3V9bI
	0AUCZYw01VPEewRoTKHb/0/cY9P8/r3gSiWWjL1u/2g2lZK5+PS7zubwXRf8nCL2UK9IOMrQd5fbT
	1B3m9Vdlgofk+C9ZhBCcG5/j8iSfpu7ji2bn2KCEKAw/H8jjze9xhREiYwEmcWx3CvmJMYcPgd3kZ
	/8Lu2RpEGE2YR5NvYrT6ByH3LoKlVLwCcTAgox5LV3dnRnVRTWQcfpGpDf89my/kN29PGPWEiAAaJ
	OfHiTR0HHXyUimVL7owQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFkFA-000OK9-3x; Mon, 16 Aug 2021 21:34:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFkF7-000OJm-2V
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 21:34:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06FE460EE4;
 Mon, 16 Aug 2021 21:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629149640;
 bh=A/MP9TWlw+XqPHTw0ocgamuLBQ3WiXFgC2I/e2wda94=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E54ttbG8zO+IFpIyMQor2zD+vgTaFDn2o/czLOItV7dldkFLhyOXR3eY5GQLJy7QC
 drwxsBV+ZGTbEaLHkePlZ676eDZfDAXSw1tsvEaT++A2FDEXGuAFs26DakJSZ54D9Q
 RnOUgxfw2MFXVPvoYkc5pUawMqsHcFHRLzZ5LZRCMTKr1/TSK0/WXknZJr/a6IQCrv
 knCpROq6m4FQtGIMAUvC317txV+jIn2OcwiVPqcReJSeZcYQabFIPO6/EUit4cdIOS
 1COxQ5OikwyLwhjE8vdfUCaEQj2dSFp7oJxlRMOTXo486ajAg/fcCWllulF59PW4Qh
 juB9E8b7mDL2g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.15
Date: Mon, 16 Aug 2021 23:33:54 +0200
Message-ID: <162914958933.240013.2336454374694008313.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210816210014.577699-1-bjorn.andersson@linaro.org>
References: <20210816210014.577699-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_143401_171927_EFAAD646 
X-CRM114-Status: UNSURE (   6.26  )
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
Message-ID: <20210816213354.TPDSWfd2CvKbFs-kwYM50lB3tacTdat-JU6EgpTNe34@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 16 Aug 2021 16:00:14 -0500, Bjorn Andersson wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.15
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: ecdbda1746b5bf771cd86dfeb84c20d62f5bfc51

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
