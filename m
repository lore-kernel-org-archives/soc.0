Return-Path: <SRS0=NLw9=NJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2646C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:37:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA20560238
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA20560238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CfAEFuXNgKAoiUtCICfNMBptzxZReZ7Mx5DJEz6ppT4=; b=13YygSk6HDJ6+k
	F7UzAUbO1yRWkkpzQH3Hfq/HbdJlwnHRKM8gZMzEw21QAolNFKPCz6ZsbEezUk7GugT7qwrF0BzML
	MvvbxqAr7+HjLYRfdq/X3FOZMPIoc10tbgr1LV8RT+KXViW6Y+3TxnGNy1ZwZbSYLf1dWk1DEd88v
	3vKw7cnwzbCmytzA/KYG89dHHcbyUymekd8t6h4hKUrTdN+XHuH9mzvTmT6YON70RDRl6MBoXC4Hd
	UjUgANlOv4pXBLCOXbgbA+mh/yWqqydAYG4cflAbYiZr8LY4Q0E5eS/1dZjGgrBFqCASKdBuV2fBB
	ox8mhpOhDorih0ujvgBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGLiU-005hho-7O; Wed, 18 Aug 2021 13:34:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGLiP-005hgy-Tv
 for linux-arm-kernel@lists.infradead.org; Wed, 18 Aug 2021 13:34:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 394FE60F4C;
 Wed, 18 Aug 2021 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629293685;
 bh=Z0OtzPiQEVUXlvnIMq7uGNCiABndU5sOI74VjC79fyw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rDkHI8s4k/lAorGDr3QGCDWhaIgLbkgZOQhYGkMtVVuOz0t2rIQ27etNihU/z7WwH
 Wh0S6db+Ffg9JlakiIucdpihTX8WPVk/A8gjLXygzpHoqj+NffHzGtLKLdD+U3Gcqc
 xxJK48Mx1q9P2q1B1dNR9meFJCVk3RAhjqC2Sx/3Fm+nejpXca0wwvmWXbcflXspo2
 0CNn2csd2co2iZ6CkoGrovPb+XR19BAS41fXL0EnksehCFOKREMxHljxNgG5RwUSoL
 /+jvmlflxZufsYz6/3bXsSl3r85QMDcNmu+L1sE7V2J6QIHchhcnjVuIXc5FZduSNI
 uCveD7IodYEPw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Olof Johansson <olof@lixom.net>, Andy Gross <agross@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Alex Elder <elder@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Caleb Connolly <caleb@connolly.tech>,
 John Stultz <john.stultz@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>, Kevin Hilman <khilman@baylibre.com>,
 Junlin Yang <yangjunlin@yulong.com>,
 Iskren Chernev <iskren.chernev@gmail.com>
Subject: Re: [GIT PULL] Qualcomm driver updates for v5.15
Date: Wed, 18 Aug 2021 15:34:36 +0200
Message-ID: <162929367332.377646.799358526302496478.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210816214840.581244-1-bjorn.andersson@linaro.org>
References: <20210816214840.581244-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_063446_022651_9E45C66F 
X-CRM114-Status: UNSURE (   6.93  )
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
Message-ID: <20210818133436.oHg1qpXF7yE7_rffvQiPSaIpNSLKYgE1Dtac7ISns3g@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 16 Aug 2021 16:48:40 -0500, Bjorn Andersson wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.15
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 5c785014b67fb25d8e2a36d24940dad0c416a005

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
