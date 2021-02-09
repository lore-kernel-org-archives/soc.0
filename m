Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C04C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:07:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7104664E40
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7104664E40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f862A99aoANLgyeqFtYyshr37IF3qqm3vST7yng+xFY=; b=pj6BLKNSs5pgbHGJVKcn6eDDV
	2SgKI6rFY2njTq8vY2B50qUzOiM/yhEX4ks4ZPHJLABBuKlWIii6cp31Z5067d6805JxapJmZQRG6
	I2ulv4vLE9xVtecMBPyM7RO/MnBpnL5rhPVHq4zt5FgndZugciFCiX3WVmIgZP/8dTgIl4gMrepLF
	m+8+2SolRdET9RRX0njN7vlodua9bowQ1WuasSNXQ4iAhq0Dh1T7kOjy+I52mrzhCVX6n2mi5qGXu
	pkw+nsUFF+ZvkO4vK2h9rsPnreuESezJFtdl9lLnhXqha32PNKVH6JeKTHJZrJvuY0mWDN7k1Q+15
	Nh/l1t51w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9c5W-0007Dw-PM; Tue, 09 Feb 2021 23:06:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9c5U-0007Cx-CY
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 23:06:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6654F64E3E;
 Tue,  9 Feb 2021 23:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612911986;
 bh=oB4tIzOClHplFUemBkY0E8w5tnOKnNu44xzqHHz985M=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YnMmZR9SRE7EW27CqpqSDpSgJWL4O8d90iSw6JkqzRW0xwfUf11Qnss0UIGti61W0
 VASccT3bxHj1Yd+EkozvJ5/4nYknafkNKW9IEU/WMHyYji0XE3vctU2xAHYfrDCamH
 iHTcpPyzQUEEl6Xv4WmKraHoBQAIDeUqW3JAM0v1S7Vtg1UnxhBEL4MNDGy3wI8TTb
 UtICx/AhmCrpGYrf1fyTFKrzj/0ULd/3vWLPlxtfh345mGgN7hbGxJk1ixkSaYbDIs
 WA5QGqtkvM4m4C4y/kqxNXoM1QLRze6p1WH5h4UmKk6oIhpODaSFkNDd7SiDwH8RFC
 3btXQr4D4ZJ2w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 soc@kernel.org
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.12
Date: Wed, 10 Feb 2021 00:06:04 +0100
Message-ID: <161291108058.974605.13581246808545504549.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204052043.388621-1-bjorn.andersson@linaro.org>
References: <20210204052043.388621-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_180628_506600_D1D52866 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: Eric Biggers <ebiggers@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Steev Klimaszewski <steev@kali.org>,
 Caleb Connolly <caleb@connolly.tech>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Danny Lin <danny@kdrag0n.dev>, Arnd Bergmann <arnd@arndb.de>,
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 Gustave Monce <gustave.monce@outlook.com>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 "J . R . Divya Antony" <d.antony.jr@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Olof Johansson <olof@lixom.net>,
 Jonathan Albrieux <jonathan.albrieux@gmail.com>,
 Vincent Knecht <vincent.knecht@mailoo.org>,
 linux-arm-kernel@lists.infradead.org, Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209230604.Ec0SrLBMp4Zy_Uu3XfqhqZBciv_0b-ROeuuVBs7ZqXs@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 23:20:43 -0600, Bjorn Andersson wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.12
> 
> [...]

Merged into arm/dt, thanks!

I noticed that this came fairly late in the cycle and has a fairly
large amount of changes in it. It would be nice if you could try
to send some of the DT contents a little earlier in the future to
avoid risking them to miss out.

It could also help to split up the largest branches to make them a
little smaller, e.g. by having one branch just for new SoC and/or
new board support, and another branch for changes to existing machines.

merge commit: 8a2b1ec1708566e032f22a95635ac2d105103b42

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
