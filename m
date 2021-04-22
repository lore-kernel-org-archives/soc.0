Return-Path: <SRS0=vqev=JT=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31519C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Apr 2021 14:12:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A03B61404
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Apr 2021 14:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A03B61404
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z+Aw3QfC+pheWhllG9tvJ/niQHr79STyXp70HOjmmkw=; b=KE/ihrF4Kn63eDtO4lO39oTgbU
	hHZmqNEby522IyrMsK0k8aHPo0Rv+RoyffoaJFYegHtpD4p9siWc+z27NiNcLYnH65XkteUfzaCaD
	bCNsGme/Lnf4ycJjmaKCBB3AjnLyEHN5UISW3lmA0v9sZlmRqslqzg/53N14m+ANmrQaQndwqYwb7
	+KXOT4KNDOCPqmoDE2dQJfMwg1/NxdeG6Ezl56IahcD4fblaA2iLEXeYyl0LYZ+p0Et0Un8DPcCbk
	lO3GUCzpCfZO08Qmo9xBkJzgxqThm3vm1A7OBcYZ/65cA/1rE22WBDfV7XJrOps5JNe2OJwcZOYwx
	OxbFCb2g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZa1w-00Gqwf-1R; Thu, 22 Apr 2021 14:10:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZa1q-00Gqw1-Rj
 for linux-arm-kernel@desiato.infradead.org; Thu, 22 Apr 2021 14:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=i/gDYokLkAPezwBUXb2BsOr5s2Af3W3ok0V9LpWquAU=; b=T8Ts1I6P5pjOuXOqL319T7AKYN
 9t4QVAAP5UHJjgvHuy/EhGNgCRP5O0dj1UHXnpwC/bsq7ab4g3WJR8a4Mke/FIW8a+qh/aZeWP55S
 /D4LIdUJ7x3Sz1JpunWauZEZHE3RQo+3T4M0zfMyZAY+rxvgU21MZNUxrLx+tsRDNKsy5C64sVHk8
 Vu/qQYiNxfoFSL8KbpKo0HpQc3/Br4I2BNqOETRMGpuBjrC98ztjTT4gTX+vfOszgIBu69aCZLjFv
 fiNUAyxWSQLr+r3ljfELrV964rwBRPRnE7VAci5bqStLYM7Y5DcyYjsg5i65QUzf0fu5FynS73Uvz
 ivBK9FFw==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZa1n-00DkHY-35
 for linux-arm-kernel@lists.infradead.org; Thu, 22 Apr 2021 14:10:00 +0000
Received: by mail-pf1-x436.google.com with SMTP id w6so17227534pfc.8
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 22 Apr 2021 07:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i/gDYokLkAPezwBUXb2BsOr5s2Af3W3ok0V9LpWquAU=;
 b=N7ENIt8Xs1yz0f7dPTt2wNX8vJT0WXdfihgGZ458k3u9hTanbU2jzxaWIeLrhxQn/d
 iOcNH+djBrtHU4Kqx0jkHYue8jOjGc6FRX17eO6QUbmnPsDWtQQctwdYvUMwn3Hfzodg
 i0NXr9LIBghXDvgk/j0lnsClK5w1kj/1Gu0VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i/gDYokLkAPezwBUXb2BsOr5s2Af3W3ok0V9LpWquAU=;
 b=uDswIoDS48dwQfacJkLLtyXGNeYWENjeqtfn2Ynr2NYlyvX/vI0Y8FnY8X3H9w1Uqv
 4FJZoW6Cq2oMa3GWVJAXfsuvivZn+fPDAQ6APZMOkDkjadvTqDRVuFBQ5CH2WESREWOI
 EGL1+xHg2rvKtl28HxHOn0Vf9qQTKTdWh+VkeA1/wYBR1AVmqTxhOSrJy88GmihMSjA0
 ZfbXYG6fFPSCSeRP1pfOOUmSaP9/3BwzbUDQ1HV0Tf8Bl/6g8vrSN97x1X3hNPO89ZgJ
 OVylnMN5r4j2eQwzf4hHdGC5/fORzdrzukyxOKdhKowfvnaz3fjw+sXljlokXxx6qE+X
 sRlg==
X-Gm-Message-State: AOAM533/r2eED0hbPTNB61zhs49eQi/nkp92OTXHvCh0sEM3mqiWReW8
 43hUDzY7FpMonKKbD0IIAqTR6Q==
X-Google-Smtp-Source: ABdhPJyoDqs9mOArEmPY462NVPxiecr+xvGgEdEMAjNbX9P5K0PrbQakJOQWzfjdkXTJ7aeqkMpwWA==
X-Received: by 2002:a63:1214:: with SMTP id h20mr3698845pgl.207.1619100596840; 
 Thu, 22 Apr 2021 07:09:56 -0700 (PDT)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id p12sm5278968pjo.4.2021.04.22.07.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 07:09:56 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: olof@lixom.net, arnd@kernel.org, w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 0/2] ARM: mstar: Internal bus madness
Date: Thu, 22 Apr 2021 23:09:43 +0900
Message-ID: <20210422140945.4131092-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_070959_277465_3661CC11 
X-CRM114-Status: GOOD (  15.99  )
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
Message-ID: <20210422140943.TcmtecfWUgJcCb87ILwaIE9TyIx43jeK2HwGwgzoX28@z>

The MStar/SigmaStar SoCs have some very weird internal
bus bridges called RIU and XIU. These seem to be a left
over from when the CPU core was 8051 or MIPS.

Basically they act as a bridge between the ARM CPU and the
lump of standard peripherals (ethernet, usb, sd host etc)
that has been used throughout all of their designs.

RIU has 16bit registers 32bits apart from the CPU view while
XIU has 32bit registers 64bits apart from the CPU view.
Older chips (MSC313) only have RIU, newer chips (MSC313E)
have both RIU and XIU with some IPs accessible via RIU with
the original address and via XIU with an additional address.
To make things really fun some IPs (memory mapped ethernet PHY)
have registers that are completely accessible via RIU but only
partially accessible via XIU.

The main issue is for non-MStar IPs connected to these bridges.
All of the MStar IPs seem to have 16bit registers but the
ethernet controller and usb controller are third party and
have 32bit registers.

The kernel drivers expect the registers to be at normal
offsets and not broken into two parts so they don't work
out of the box here.

I want to hide this stuff as much as possible so it seemed
like a good idea to hide it in a header and use the headers
in the unfortunate drivers.

RFC because maybe this isn't the right approach and I'm
sure the two readw()/writew()s for RIU need to be protected
somehow but I wasn't sure how.

Daniel Palmer (2):
  ARM: mstar: Add header with macros for RIU register access
  ARM: mstar: Add header with macros for XIU register access

 MAINTAINERS             |  1 +
 include/soc/mstar/riu.h | 28 ++++++++++++++++++++++++++++
 include/soc/mstar/xiu.h | 22 ++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 include/soc/mstar/riu.h
 create mode 100644 include/soc/mstar/xiu.h

-- 
2.31.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
