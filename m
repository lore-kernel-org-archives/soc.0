Return-Path: <SRS0=5DOh=GF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC602C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Jan 2021 18:05:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1ED6207AF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Jan 2021 18:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1ED6207AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jamieiles.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=okuHzxv0DWXIecp/ATcmLxuMsSz/FNp5vkGPx6pUP3o=; b=l27hzpy0QtLKnpEDtqDTDElwy
	0mVL9wRUDB2ahP4/DYFfMBDurV6iG1uHdpdaOaA9t+FtZcp1dWG3oihu8hE0Ni9CaY6cZQYAFu62/
	I1rJ3QY250s7disQlo2WKtE0E4jDYn+c2VvlPP3ukxg/ei6JELVGvBf3v35Z6CyB8oCimY1VwTJ+c
	v2IVoAFSyf6riaMI1P5XNS5eIhGufDE9qEvEklz4M4HhVDndweP0LVL4jtiE2kYdBEsjhG67TBsEi
	3xdSW0tnD3tTK8hOQA6NMrv/BQ5AxGcwux1YLxJSAMtvLH5U6m8b3MXB3kVv7sZ/QvMESZALu5093
	ANz95PjjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvlG2-0005Fg-Nr; Sat, 02 Jan 2021 18:04:06 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvlFz-0005Dq-EU
 for linux-arm-kernel@lists.infradead.org; Sat, 02 Jan 2021 18:04:05 +0000
Received: by mail-wr1-x42b.google.com with SMTP id d13so26813437wrc.13
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 02 Jan 2021 10:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jamieiles-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PWNWWtqjXuhRBofwhd880gtdlxvyGF0Fap+WwqM+hHI=;
 b=eLkwmntFIPeqPFQewS/PKJ6gDMz4HGYh3W6ZYAGXhokmV6sf5ibtMWI5E+2XB+4idI
 uNCCrtDY6C/B8YgiUE/W5pBcfP8N+NIugHE2bpXA6L4YU4RLE+YeF9bfrFH++ywUHreB
 bL44ihJrCPs3Tdmt9c2y0bn+0+kCQ8qz13085qwaN6P2rua1wopu+dK7zcEf/Ybny58R
 oXD962oNTItAx9o+gO++axdhJ9NL3MukKK84laW+nctEdWIW47S5+rTJ4Wpy0A2RdMTq
 f3S2Y7vnDpWljJltpWBs8tekICKFtP5hfYhgqmfjdpjGM6AZrom3HkWnD5HyRkC7mhA0
 eE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PWNWWtqjXuhRBofwhd880gtdlxvyGF0Fap+WwqM+hHI=;
 b=kfBo1hqrbSym4Fc00j9Vtld87HGvoQCCqXk+xWpifG/1zKYER8EAmuWXMhwWI54LVv
 EI2P3bX6mqEtUUdCwp3yT8+lcO3SBkZoxF1upyLrsBG1JTZvF3NBqd7jvVrq8lHkhEno
 DoiYvNl1jC68ZOV5Fqm4mzA6+awFOV2jJL1O31l+w4/9mdIi0BK52zWLgptGBIPsIZGA
 XvBu0KvGb0yt1dIvFWHdx1cPdJY37mFsBLO89xanAgSwDNipf9uKUElwA45hCia32iVj
 Po682QEdxQMVTx5iIBqanK2nCdn5Pv4LkMqrxRMGEQlM+lq1fCFl3VhKdB5B9ZSHbS/z
 9r/g==
X-Gm-Message-State: AOAM53319ugKY24GMxqlcBNBeENGI+bn4eitKL8oRmf/DgWh9Igo0yUF
 6nfIG3pW7rSoefyf56xKGM4VPg==
X-Google-Smtp-Source: ABdhPJwRL5VBumv1xxr0bh6v+UMGz68EkeaPJuNuO19pyYUeH9obAVZlMtLxE2oY/yePO+FrdyRXsQ==
X-Received: by 2002:a5d:6909:: with SMTP id t9mr71553849wru.327.1609610640397; 
 Sat, 02 Jan 2021 10:04:00 -0800 (PST)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id b7sm75991272wrv.47.2021.01.02.10.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 10:03:59 -0800 (PST)
Date: Sat, 2 Jan 2021 18:03:58 +0000
From: Jamie Iles <jamie@jamieiles.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ARM: picoxcell: fix missing interrupt-parent properties
Message-ID: <20210102180358.GA4063852@willow>
References: <20201230152010.3914962-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201230152010.3914962-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210102_130403_701172_D5AD2D6C 
X-CRM114-Status: GOOD (  15.79  )
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
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210102180358.y49oRA5o456Loep8-d2xrERwPmJmQ5H6Z9vy0ACKErc@z>

On Wed, Dec 30, 2020 at 04:20:05PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> dtc points out that the interrupts for some devices are not parsable:
> 
> picoxcell-pc3x2.dtsi:45.19-49.5: Warning (interrupts_property): /paxi/gem@30000: Missing interrupt-parent
> picoxcell-pc3x2.dtsi:51.21-55.5: Warning (interrupts_property): /paxi/dmac@40000: Missing interrupt-parent
> picoxcell-pc3x2.dtsi:57.21-61.5: Warning (interrupts_property): /paxi/dmac@50000: Missing interrupt-parent
> picoxcell-pc3x2.dtsi:233.21-237.5: Warning (interrupts_property): /rwid-axi/axi2pico@c0000000: Missing interrupt-parent
> 
> There are two VIC instances, so it's not clear which one needs to be
> used. I found the BSP sources that reference VIC0, so use that:
> 
> https://github.com/r1mikey/meta-picoxcell/blob/master/recipes-kernel/linux/linux-picochip-3.0/0001-picoxcell-support-for-Picochip-picoXcell-SoC.patch
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Jamie Iles <jamie@jamieiles.com>

Thanks Arnd!

Jamie

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
