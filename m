Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22602C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:49:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE8AE64E2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE8AE64E2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yPbnJqTjAqyg07EE65RRGlVeFnybFMkRNKEfIuN0hSo=; b=j11xRlwGf+k8YHiHSCL+08wB6
	XqrNa97ncT+B+5QMgIjMNv+7hLtFWM3qbSuynA2QmeRDo86rbU+BDWPPalvzpUKciNI/iNJGFYJfg
	r1HilLVFIzch2tvwWDrl9/AGnWSTxkhyVYSENwLVfB+g+60tl+ApICyngS+eUdKybErr/IHa4J1UE
	8NPorjkvqjGIZyL643D++pLzv8UC7coxXaq54dWKN9S+VO6b0bY94gBUvSasAI+roIOMYO7Yx1bvk
	RzUkUXDmxUvde7g7OZHuGnp0pWx4z6QAgG3tqdD7qNUn/+KlfTvhg0LaKVlDSU6FvUcQ84ZtfTKCW
	ZlV2PMZRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l73Wb-0005FX-7k; Tue, 02 Feb 2021 21:47:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l73WY-0005F0-En
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 21:47:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA36764F6A;
 Tue,  2 Feb 2021 21:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612302469;
 bh=i6wiBXjXHYMQrIXKdhkijXXD3Eo65HiYuZQsy41rUO4=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HCTYCrch6t+4j01Nt79LG/6JvBALr0O2b2WQbiygm/fkM+WMJWDU1mQ2jyrCGQNqF
 pK+gzu6biTZmfs4RVkRVU3lJ0g7K8yq3b27bmULlLxoUXrLVOpXicMxFDeunLZMkqR
 OZ5M8PKnpI8A9idWE+VUUqcdU1IUja/09vjHBUUfj4Qd+7H+GvutiiylsAyaVOlcYW
 AfdD6L8NV4s8jhkgCB+HWWOd42roMwQCE+8Mj7OfeQtxhTUWgHEeLgSSPfYpmyebFg
 6IbtWZkKe5MU3dBSWqmzH+qSNpDuKxMDKorZFWoM6rM0xOsoX2+lEAkseaZnenvg17
 RebhoCemZfQ1Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Subject: Re: [GIT PULL 6/6] Broadcom soc changes for 5.12
Date: Tue,  2 Feb 2021 22:47:45 +0100
Message-ID: <161230245972.1905468.13486794667754807651.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131221721.685974-6-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
 <20210131221721.685974-6-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_164750_625529_E5C5DFFF 
X-CRM114-Status: UNSURE (   8.70  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, khilman@kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 olof@lixom.net, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202214745.-n62QPAQAJB2P5kj-zBZWeFrg4-jJSa9NsGxWDvoyl4@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 14:17:20 -0800, Florian Fainelli wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/soc
> 
> [...]

Merged into arm/soc, thanks!

merge commit: f79bf56fb2b5f1540ba5605ba28cf89ee9dbaadf

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
