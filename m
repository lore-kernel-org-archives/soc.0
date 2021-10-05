Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE80C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 13:57:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ECF5610EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 13:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4ECF5610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+JCbjRBK2/d+OU69+wYyDitFVOe1InRzP77r11wxks=; b=Uly0wj2Q6yvvls
	JhJyU8XawVV297ibxcn/ZX2EazvUUUic376m23g2uTJbyhUyzV24gp1mHBO2coOf9ThMN1AxIV0tM
	oyrB/Kg6DzYsk1OnrBzeNyZDANfa7CtyOpYmWt0Dpn/XM1i6Sjpj6Sovwl/3Rbme6KMmzdAyt+Qoe
	F7KNIcuAM2AxKBFVePPWAfEoHR+HRTbZvAeDUpkGnpfRkhVq/NhOwMRs7kLI9Ylup2Ms/Z8TC2yxw
	QaZ5t7Mk/mAi/yoF1BuklI19YJbkRSUC4GeY1r83cpuSME2Jq8jWhkPjAR66741YNtBaw41Jj9qi5
	guacktN+D2hQfaLoxzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXkuf-00AhMs-96; Tue, 05 Oct 2021 13:55:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXkuZ-00AhKq-2n
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 13:55:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C2E3615E6;
 Tue,  5 Oct 2021 13:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633442114;
 bh=0yFLZfiig6DnOFmH1BxwGDCchrWxNojEqVqmvxccNEs=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dvj+1UNbR8kKCFrZ0ySq+u90hm854TnBluJHQx3Lu4HSEZ2D3bw53z/vf6yQ8wPVP
 89H/0qezVcQn+bn5r0JNv3wqkoB8bC8XxuxfxF7zdVwA24QkQYL1I+F4IYOV92duB5
 kkJYpOWu+IHaeOFVqKEGuU0hInrg/s6y6e50mxXan7tXmTAJmDDu9d/WTqMVuDkIIT
 1gkJma+toGRPOWkp28BTASQYMVEh6pje73816UbPEU+9iZc334HX+nKGGHo6Ky2JKk
 tubZNK7K/94AY7rC37zULzDpNOVCobXkllFvhYqQWkp17TJ3s1vxMOg7xzVTjhhQhf
 Q992RYBpNsrnA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Shawn Guo <shawn.guo@linaro.org>, Olof Johansson <olof@lixom.net>,
 Andy Gross <agross@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Antonio Martorana <amartora@codeaurora.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-msm@vger.kernel.org
Subject: Re: [GIT PULL] Qualcomm driver fixes for v5.15
Date: Tue,  5 Oct 2021 15:55:08 +0200
Message-ID: <163344208491.2721567.2925197313159262269.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210930025456.1035-1-bjorn.andersson@linaro.org>
References: <20210930025456.1035-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_065515_183697_E8BE5E4C 
X-CRM114-Status: GOOD (  10.14  )
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
Message-ID: <20211005135508.HTCXsW_Jjzznw2sR_uCscqvIsdjkINN1MFyd0pGF7_w@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 29 Sep 2021 21:54:56 -0500, Bjorn Andersson wrote:
> Arnd, I noticed that I've had the QCOM_SCM change from Geert in linux-next for
> a little while now and would prefer not to rebase my tree. I do believe per our
> other discussion on this subject that QCOM_SCM becomes hidden and therefor
> shouldn't depend on ARCH_QCOM again.
> 
> Would you prefer me to respin this with a revert of Geert's patch, or can you
> effectively revert this as you're applying your patches on top?
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 6147eb53bb80a8d12f1c9de4e3474bc9524053ec

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
