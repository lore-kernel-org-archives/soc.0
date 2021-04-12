Return-Path: <SRS0=5jFp=JJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A98C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 08:32:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6BD8611AD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 08:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6BD8611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EvhmxdoffRod+52EmRm53iSEm5jZc7jrntc3bO4+cac=; b=IC/StC2dmg9af6XGglyDy4Jknk
	N5lA1vUlWUkQaTfB8TETHspRXtsW3t7e0Gc74Zs7raSuEyqXYmcxrXVuoxtnLSQA5NDoPCL5WE7xn
	ki+sMkIjgcsSvu4TJrALN9HECQcfhun9SrOyr6dBdQHnFbwMju7S59hVo3DbCl7QjSA02jcGgNedi
	ku1SFP5NfWNS/w65PTaamKye7HelxhoiI30BTHniDGHd+G+ztaGFxE8VHWkX8pC8HgUa3c9HmC8nu
	sygjvBcYDTRJvcP9B4t4Q+nCJEu+2gIeS1AjQcypxZML+wk0u7KDgyOZe1GZlFI12K1sDa4GcWhxY
	/aAbEmGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVrxZ-0066lF-1m; Mon, 12 Apr 2021 08:30:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrxI-0066hW-0e
 for linux-arm-kernel@desiato.infradead.org; Mon, 12 Apr 2021 08:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Amc2LskPzEPJ/lntSSNH6enJaQg5HmwehQo3JE3bhmA=; b=YogWS4iytYFih+eVNg1oJz8CkG
 wh7QG0ClBqIxUOkKRqPqkc28FVReuzYkE5B5HOBQmnrzzjunYCNqIFq55wD+PRbxZ9nhqjduZGRMf
 QCgMwX0H3hSwwCDAh18hR/11bGxVBawGmvUi5SsvMXqQWHqpNTuFceH3Y6LzDN78ZI1YS5q5yynER
 bYkfjwqRRmF5bva1SCj/x/UNagpRa/J9xOz4jS0XKNZtBNcCBs3VC86nyi1k70h91UspD+OQpCSAU
 yhQJom33ZmV4AXBOfPPZjJLLkN9ojSBYNZLYR//43RsX6t71M2swxVaBrKqWzOogLsDtNacKAj7HZ
 kXGR/K8g==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrxF-005ycc-4M
 for linux-arm-kernel@lists.infradead.org; Mon, 12 Apr 2021 08:29:58 +0000
Received: by mail-ed1-x531.google.com with SMTP id w18so14076451edc.0
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 12 Apr 2021 01:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Amc2LskPzEPJ/lntSSNH6enJaQg5HmwehQo3JE3bhmA=;
 b=TwWkbmRk2sAPMMe8uxguQ/yZVefGvbjwl+iir4D832FNABHNURbxmXeL9lsbQlBVSI
 TTnv125E11y1rykHTBADNnazz5YMlw7ZsdV48avNNV7uNK2Rix1fbUSj9HhT+TlIlKyO
 ESURXubPwJ1w6o3fWUHqX/iIhiCmStxwxUEd9VcSw3Ulv4PHgRpLtsYGCDRtBg3tDaRL
 +20y8eXtlSHIM2Mwp2QczII0DJg69EmLzHRLaAM+ci2MRKt+5RORk4zBNm6piT202AzZ
 vgbHrh1k99qEAwc4I5diJKiIqhlUV2/3Fs70o+epRvkP+0VZekjiJsaeDUNIUk9iyfRD
 zH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Amc2LskPzEPJ/lntSSNH6enJaQg5HmwehQo3JE3bhmA=;
 b=GLIcS2zREJ1/97NiZ7jFOvM8MjsP1mQ/CAMDOJOb8/oTgBiOLDQOdu8Oja3dMCHeGh
 S5kvsU4CcaojjYacbUOfCi5DLdfaWB5B4gbamV0RCAq3DYqjy7TAn7KzaGcbja+xMDIt
 w7nRlsfz12oja4nw5sAKj0ucgWUHEhYU+wGvTpKPvWLZKBxCHbTWuO7fsIUleEzkCt1f
 nb7/qqimflX1xzjK3h5++03rloAwWtXHdcT2De/KbyUI1PuGErOY55wK0D9nSQJiHohI
 PIkLJUT423pulrH/RzBGNsVzWfWMZG+36ozKkV/EvfOUpduId2Eobs/93mMaWUvJNkpH
 53Bw==
X-Gm-Message-State: AOAM530XP+0PAdJpL79qwOSrNpctKFsXFclB7DRZWrwnY5J53ubHipxr
 gPra7tTfOaA1+g8q1WwBdkH0sxXPt46QikZt
X-Google-Smtp-Source: ABdhPJywqGmOLTkQJZfDGrFBInB2FVsx+9QTOZVrYHRnYpkIHLASR8nAfSfDA1DZKt/MYLjHuagCHQ==
X-Received: by 2002:aa7:cf02:: with SMTP id a2mr27901050edy.59.1618216192818; 
 Mon, 12 Apr 2021 01:29:52 -0700 (PDT)
Received: from ?IPv6:2a02:768:2307:40d6::45a? ([2a02:768:2307:40d6::45a])
 by smtp.gmail.com with ESMTPSA id a9sm6027910eds.33.2021.04.12.01.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 01:29:52 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: soc: ZynqMP changes for v5.13
Message-ID: <a44f8e9f-cea7-57ef-c3bc-10f5f5e064fc@monstr.eu>
Date: Mon, 12 Apr 2021 10:29:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_012957_235228_73592133 
X-CRM114-Status: GOOD (  11.01  )
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
Message-ID: <20210412082951.Rcs-p1ECB0NBaK6g31NjDlQoGxstiqoChDhD3wcr-B8@z>

Hi,

please pull these two patches to your tree.

Thanks,
Michal

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-v5.13

for you to fetch changes up to 79bfe480a0a0b259ab9fddcd2fe52c03542b1196:

  firmware: xilinx: Remove zynqmp_pm_get_eemi_ops() in
IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE) (2021-03-01 12:52:07 +0100)

----------------------------------------------------------------
arm64: soc: ZynqMP SoC changes for v5.13

- Fix firmware removal path
- Cleanup eemi doc and *ops()

----------------------------------------------------------------
Nobuhiro Iwamatsu (1):
      firmware: xilinx: Remove zynqmp_pm_get_eemi_ops() in
IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE)

Tejas Patel (1):
      firmware: xilinx: Fix dereferencing freed memory

 Documentation/driver-api/xilinx/eemi.rst | 31
++-----------------------------
 drivers/firmware/xilinx/zynqmp.c         |  5 +++--
 include/linux/firmware/xlnx-zynqmp.h     |  5 -----
 3 files changed, 5 insertions(+), 36 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
