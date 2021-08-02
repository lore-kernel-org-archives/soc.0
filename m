Return-Path: <SRS0=DM4H=MZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE17BC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:35:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C10FE60FC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C10FE60FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pA0p7RoRGhryP2qE8JOkLLV/8W41ctVleX/BP5lZlyg=; b=cW3zSk6LBt9zBG
	JgS5SwByRI+ljIQMqR7QlAuT+M6aYmtpOyhku8AZYOIRZOj/fou4SDwuFi9uCXG25QCP8P97P6xom
	ks0l3ffsqSKEPNSyNp0iLouc7OyDHg8N0jW7N9px7i+z1KazMdBRvF/2IJ3XnPNgehk1N7/HdUAm/
	KjQ9In486RylGEZCoiVPBuzWNNAV4Yk9yS4SsTibfXZTpIaqPs5YGMKC5xVB5Wfgu9Hqo43lskn0S
	aoldPW7mfOCCwnXgo7/Uaw/n8xhbBKE2geurt5Coo0OfkJRq4Mf6AuhQKp5eUPCyo2APG9tDfhmOP
	9JA41O+7RSTYy1g8pZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAY4U-00GO9H-Rg; Mon, 02 Aug 2021 13:33:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAY3z-00GO5I-89
 for linux-arm-kernel@lists.infradead.org; Mon, 02 Aug 2021 13:33:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C4BE60FF2;
 Mon,  2 Aug 2021 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627911183;
 bh=mmqHeiFvwF9QDh60eNIsgRYt/X9zDYRV2hQyNLBuxik=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BqkfFlvAaV/JvpiLsWt+KoNrnHI5u7Z3+kp8eYA511uVAjbjjDwxrC22GIQsxYwJT
 0bHaiH5wmIBQfJ1oDuPoC/mSITwfd3Jn/yX4a7VjUs1Z6L0T+zxETeJEYoOVSKWRYZ
 0RXatXYrMHxWBcdAsLFVbxV7rGYWGypH8n5k5Jc06q9HAYq9H4HtEVMLGII8Ovtv1Q
 MQMdZay+yPdxgqMiKOd76NIvvTueinx2pGBittVTWa2cI+Pb4EUjNi3LRB/6sDQGu3
 8/ob6rxNAYXlnhPIBon5YcSmDDGUXDWiRO++T3Z0t/cFbEIsP6gEhOy3x3wlF6EXkX
 Yhj3kMJO1YTgw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v5.14-rc3
Date: Mon,  2 Aug 2021 15:32:43 +0200
Message-ID: <162791113497.1139989.17406882949519965534.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210716233858.10096-1-thierry.reding@gmail.com>
References: <20210716233858.10096-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_063303_344283_4846A0CA 
X-CRM114-Status: UNSURE (   6.54  )
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
Message-ID: <20210802133243.dAK1piLA8AqxPoXZ9ffpzm--nGrfCxiz_kr18E2vBdg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 17 Jul 2021 01:38:58 +0200, Thierry Reding wrote:
> The following changes since commit c667dcd4dfcd515ad2c9b3953a33d742985a0b5e:
> 
>   arm64: tegra: Enable SMMU support for USB on Tegra194 (2021-07-09 16:50:44 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-rc3-arm64-dt
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 79e48a21045e6f2ccd9f59737685336d9ad75d54

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
