Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01AFC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:27:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96330610FB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96330610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s9e204zA5Hok/4NkQW2ZL/5odT2eAY1Pu/9xDHgbWGM=; b=MA48PgM2L+f04a9L+TSay+EZl
	kB6Zj9283Qx5iDDfUJGDpv1OR7eHMKY0tYYaRE1X8XIXN+3irN/iSXW+LRMfLbNkL2OZuIGt8m+7e
	uRy0wgcxpzdCboFGMrSxdkwXTo36Tc4Nni1qTKjYV10WZGM3hLZIf9+YbL01xL7gJKy2JM2GBbr99
	mJBwnYC2yCazIctHseYyopFB6H032BZybO9SgHAtr7gTOUVHzeO9+x675KqidDBm1oQ+srjqpP93d
	vHtkT5o57XF50RH4v+0XMF4EcC/zFI8H/2wX5m5bH48oLaJ5ftlpk+u5SUS0miWFQvu82ELcnDsnW
	54dIsY41A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWXB-008NXU-Gi; Thu, 08 Apr 2021 15:25:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWWb-008NP5-LN
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 15:24:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB90561108;
 Thu,  8 Apr 2021 15:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617895492;
 bh=jKXKkgZ07rHIjheOw/4DO2B9AWMNAqJxWU6gGBKJ1E0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JjEMW1v1h5vQjW8wKz+HKcWmhgz+X/w4iPvYoEea91NazWA1+kbENaG/LSKIEd08s
 NC5ER2IvbBE9h0oWaevd+QphsTulJdu6/+/0Yz9IkH7p5Pe+8RBdsO/MWz4ph21EUj
 7ZJ4bWL4+hl1xxRWc91UumlX0YyvrcvVTFcKZ/2Ext50UaiIonEoIbYKKOdmW75gc7
 BjaQE8i1XvgeVQM+H6+hIhJ3dXftUKHeURFsTjtKJDM7Y0iZVpFMzt5GMdJBp2QBSG
 DBpnl/N35X6HibMgc2MD/xuiC3QBa9XiSQmZN94QrLSzaHj8Azxp7ZZnSD0aRDn11P
 V6QORIxJGYGVg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, soc@kernel.org,
 Olof Johansson <olof@lixom.net>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [GIT PULL 1/3] ARM: dts: samsung: Pull for v5.13
Date: Thu,  8 Apr 2021 17:24:23 +0200
Message-ID: <161789493809.1630479.13120302214696813911.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
References: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_162453_891754_028EFD79 
X-CRM114-Status: UNSURE (   7.24  )
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
Message-ID: <20210408152423.U4o2jpFL701B6RwyyQ4th-8eijGxjdQ0IK6I9TJWs_o@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 7 Apr 2021 08:58:26 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.13
> 
> [...]

Merged into arm/dt, thanks!

I also merged the corresponding 64-bit branch.

merge commit: 59206cf877be3a93dff0ea270bb1dd14f3010799

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
