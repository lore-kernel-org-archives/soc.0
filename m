Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0E4C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:19:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFB8F610CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFB8F610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/TErg6Du3e6MHhtUQXjtHYZR6Y7Avu3WLuwJVRAJm4E=; b=rQARzCOMzGxxemHvnYKPz7PCv
	/wEROSbG5Bkfx3xf4X7XH0HkHxEl+HwJDnYYq8A2wrDs6mCDk5PYHhxiRR2QczaCnrHUXEcxvW7v3
	1Flr3HmmmseXMCzZtBGLRuq5JIE3OGrnUWZUqSmqQW+yaADb9xqiKt0DX9K6WiDpvn9RqdmAY2831
	oXIpaaKUM7MmbPu0+PXNauU31qFPLCe3SQPjWQKYKq+Q2mN+R+u0N3i8U2uXI8bisYQqyiBU8oeQl
	ErNdB/IG+Fg84r6k9/IOGTHxY2pCOaU9qCSt6zq9uC0VydscLU+ZCIU3GVF26Yb72ohDVg9BBZg4w
	xHSNjO+Sw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3l2-00AuFf-Es; Thu, 01 Apr 2021 20:17:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3jJ-00At2I-NE; Thu, 01 Apr 2021 20:15:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6C05610D0;
 Thu,  1 Apr 2021 20:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617308148;
 bh=sThdbX3BQH54hzCIqptpC5Z83box7dgsgatbxmU8fSE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h9OjWxiV56BHRCR+kUk1C2rxvKJBGRVhWpba5CPg8s3jazlh3P8f1qBRvyNFUvLAC
 UwlwqmAp6qGIOFcwmlsl1ofWvoJcSrZr5BQkL0TaAJAwon1MDjQaOT4I1ZhJS81heA
 KsjuFJA0OlIpQ0zgnspP0DMqx+pYehRy/eoyYduggqgVeT58qxc2tiVDdgdNhW7tlb
 bR7fr8YfCni1czz/mZgt4uPvaTYZO+URAD76x9ATZDAbXEpYQnG8k1ca7SZyY5U0le
 xWVn20OonkbDTJPyPTrHTtPyVIjW2SZkroL0FUR8hjVt13Z66YMAuhb4ulQkcTbiRv
 WL52cPkzojA2g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthias Kaehlcke <mka@chromium.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Ryan Wu <Yz.Wu@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>,
 Michael Kao <michael.kao@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Fabien Parent <fparent@baylibre.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek: changes for v5.13
Date: Thu,  1 Apr 2021 22:15:21 +0200
Message-ID: <161730808707.655497.13146893990691457286.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <d1121630-5778-0955-fac7-f921174defe7@gmail.com>
References: <d1121630-5778-0955-fac7-f921174defe7@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_211555_796697_8D0C7874 
X-CRM114-Status: UNSURE (   8.66  )
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
Message-ID: <20210401201521.I0ySY_7wDlYHfC-VzVu31GM3BDy8eMe5r88EITgWSSs@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 16:14:20 +0200, Matthias Brugger wrote:
> Please have a look at the updates below. As you can see we have quite some
> activity on the MT8183 based devices, with a whole bunch of new Chromebook
> bindings added this round. Apart from that the a bit older MT8173 still gets
> improvement, which is nice to see.
> 
> Regards,
> Matthias

Merged into arm/dt, thanks!

merge commit: 7d534c3a5e1f52022c889ed10c413c54ac2a4d0f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
