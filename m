Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C587C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:06:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3358D610FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3358D610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1jye34854rSwgjV8jPtOL+NNyRIPuw/YoRYvttSL1gI=; b=Xh0Pwjvm3ABYkXoQEg4DvAsQv
	rTghxsfPsjwMilBAl2837IF8pXnhdBOPzROcGYXGktBcfssG8Qm1V4J2CJeq3rrwx2IUV4jLvoTHP
	gbkyJmQY/JKgUheGOhSY2/7ePdgrE6eKY+hOwNXLXayV2FrBfrbE7BLfPqgSP5T3XCIgpOGaIOAx4
	zgYqGnYdouTx/xmJGruNOJzeAaaA/Clp+ytCmRR99o6g2cX5HOqXFYPA8PWH4xAtxGNOqk6nKUy3b
	ccO1INKc/eCF4ReBZiXFwQXeL/0svzvZP5SwryQX7D42x5EpP5nv5NW9nqgVNdii0N0gDVtpgbE0x
	c0K3OS5+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUat5-0099cS-Kq; Thu, 08 Apr 2021 20:04:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUasv-0099bM-VX
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 20:04:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A363C61107;
 Thu,  8 Apr 2021 20:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617912252;
 bh=q774uT9f38SSGcsrWcfTXh4l9PkW7PDh1OA4r2Aoef0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JumN8qjMKYpVfGACHDVafEFuBYeg/2lBZkbkUMNI10CMYDlRqafNst8XihCU9h24T
 a6KuxC//8Qt2wewDFDOSgfD7jQP6lvUxUkFFFXZZkaz0vkWtW5qkAvN3MA7YfEBa4C
 TN/HHkYfvlnkjCQ/rSVospc6j/K9cggZchy5m7+HmcWLncYDElI/PRdmuSQzRXOkf2
 fY4WXkMzPPFdgUjOT9FbGTrYPsrjkbuScfzdPKU4RuMROcBXbi/GNa3sJU3Lt9QyvL
 2mWL/FzplvfeQ5QouW9Zld01jAwxoD0zTZI9Q25cyR495AE2ykz6haMZI6uiENYrit
 dyznzNiO6fBGg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org, Wei Xu <xuwei5@hisilicon.com>,
 arm@kernel.org, soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, tangkunshan@huawei.com, olof@lixom.net,
 zhangyi.ac@huawei.com, fanghao11@huawei.com,
 shameerali.kolothum.thodi@huawei.com, john.garry@huawei.com,
 salil.mehta@huawei.com, jonathan.cameron@huawei.com, shiju.jose@huawei.com,
 huangdaode@hisilicon.com, liguozhu@hisilicon.com
Subject: Re: [GIT,PULL] arm: hisilicon: SoC updates for v5.13
Date: Thu,  8 Apr 2021 22:03:34 +0200
Message-ID: <161791219759.1659621.15630743637327308533.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <eba8b55e-0969-8ca2-eca3-7c471cb0ff6f@hisilicon.com>
References: <eba8b55e-0969-8ca2-eca3-7c471cb0ff6f@hisilicon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_210414_264065_CAD5407E 
X-CRM114-Status: UNSURE (   6.68  )
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
Message-ID: <20210408200334.6DduM9wce-KWXF_LEz4V_1hedTIqF6XcC-zWzxjcVPQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 3 Apr 2021 22:59:06 +0800, Wei Xu wrote:
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei

Merged into arm/soc, thanks!

merge commit: d74b25572a4f567b1a200a68dc0d9a9ec9d15390

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
