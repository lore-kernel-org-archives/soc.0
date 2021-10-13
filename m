Return-Path: <SRS0=+cAE=PB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0CBC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 17:42:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7FFB60E0B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 17:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7FFB60E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91x5pUfeekIXw6UEhfZNjmPaZYHNW11WP36susJj7Ow=; b=nZcOFdM3C7EDXU
	ZiNsaTmewCIzUT2Sha/LQNkzBXTc/Euv39zlspDrmT3o8Jkie58LS560KyDSwiQskedn8T8F+I/ML
	aBp/XYxTYIK9+1O86TwMm9uGgh1YgiVFPoJac607sHYTQVzrSYApvuhqkYvFLhkvZK+kS4nZEaG44
	1e0yqC52vEDYaBfxoVRxsZeGjLeBPFTFPGvZWORCuKFhbsP8iLmssQXGUybRl0+jUyOX2+hyT731X
	rWiuQQZVjim2RQByF4fmwI3jtFLFhuxjcqHVxoWXk+5WGk4gC74TkuT7TEPSxAj5UggE5amsvMieF
	uk11xeGUZK4qsJI9NY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maiF2-000Bc9-FF; Wed, 13 Oct 2021 17:40:36 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maiEp-000Bae-MU
 for linux-arm-kernel@lists.infradead.org; Wed, 13 Oct 2021 17:40:25 +0000
Received: by mail-pf1-x42e.google.com with SMTP id m26so3142211pff.3
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 13 Oct 2021 10:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ofaUTA2ZywTeTIKfdMxgxZ82ehjml1HUcHNnSixihZc=;
 b=jo1BJaw+Vgu6kR3hW09prRQasFJfMFQYbjHypr1yh5ASbUhsKWtSolqCYhVXkLmDQg
 xZp/1f2TKOAtj5m/0bjpbszuBhOiSJOzx9v/c7Ctfq9LQ9zPAWUkx8FhTLYLSWAeJEEI
 w6tkJajOonHfnJwnbmcPUG8Zglh55aQHpnVLulHUvoWAPhVbVb0o37TswQ/U9tYAYObx
 OnB3hmCwTkS0ytVogpGVq4AyhkQTNJYtkQOoTthJ1sXVwHBPiIXStQ7wB6Quqlw5udQF
 t9eVJ1zrfg9696FkgbaVve9ZK4iRDCX3Kye0py2lsGL7X6B/tSvAfPZ/qVC6EqqJZHhs
 PqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofaUTA2ZywTeTIKfdMxgxZ82ehjml1HUcHNnSixihZc=;
 b=piEvCTqYCO95hmy+lOhFYbhrxl19KWt1ILLTw7/DM1ea4PjyPQq0t0V/6RtQgT3qFA
 ssaJqWbm0sYRyAMtMw2z60gadhx1LRQ9IMjMV3mooDE1SGf8wSU2ewrUcL0RJBXxuozT
 SXVhmRUFEEUbwNFQT/KzSzgPfP3EJIgoIX8pwDN9J4yIXfZn3P3oUPgwu+xuQcNx4Rn6
 23D5g1vRfuDBkWTTidztLgtTaRCJiwzu7SvORL9W02/UJEabbMOD9qTr49R/SJDJ/MHF
 NfI2nEZ84v954KXhLjZZ8mseSF3uazgLVQ3fammiwYTzpMQaryd1X7HET+s7JRF9kXQ0
 xFjg==
X-Gm-Message-State: AOAM530LIX3442klTPaqET5XydSyEWWBDleVuKLXPPoWkC0HVbo/x1Uu
 BiWsu5pD0/M1hrmLw/NHFV5MLu0Ejc4=
X-Google-Smtp-Source: ABdhPJys0e2JMNsqY898UUxhYB9rYBqG2wAPCioZTR1y5RPy7nxN2TRUO9BOnFpo8/OVYQJnuNmxPg==
X-Received: by 2002:a63:3643:: with SMTP id d64mr437716pga.110.1634146822586; 
 Wed, 13 Oct 2021 10:40:22 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id e15sm133794pfc.134.2021.10.13.10.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 10:40:21 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/3] Broadcom devicetree-arm64 changes for 5.16
Date: Wed, 13 Oct 2021 10:40:15 -0700
Message-ID: <20211013174016.831348-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013174016.831348-1-f.fainelli@gmail.com>
References: <20211013174016.831348-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_104023_756126_A5577FBE 
X-CRM114-Status: GOOD (  10.06  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211013174015.z31Q-NpZlIH6kDO1jPX40D4wM04vDgwBSOWvp16VuDQ@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2ODgwZmE2YzU2NjAxYmI4ZWQ1OWRm
NmMzMGZkMzkwY2M1ZjZkZDhmOgoKICBMaW51eCA1LjE1LXJjMSAoMjAyMS0wOS0xMiAxNjoyODoz
NyAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRw
czovL2dpdGh1Yi5jb20vQnJvYWRjb20vc3RibGludXguZ2l0IHRhZ3MvYXJtLXNvYy9mb3ItNS4x
Ni9kZXZpY2V0cmVlLWFybTY0Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNmMzOGMz
OWFiMjE0MWY1Mzc4NmQ3M2U3MDY2NzVlODgxOWEzZjJjYjoKCiAgYXJtNjQ6IGR0czogYnJvYWRj
b206IGJjbTQ5MDg6IEZpeCBVQVJUIGNsb2NrIG5hbWUgKDIwMjEtMDktMTQgMTQ6MzY6MzcgLTA3
MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tClRoaXMgcHVsbCByZXF1ZXN0IGNvbnRhaW5zIEJyb2FkY29tIEFSTTY0LWJh
c2VkIFNvQ3MgRGV2aWNlIFRyZWUgY2hhbmdlcwpmb3IgNS4xNiwgcGxlYXNlIHB1bGwgdGhlIGZv
bGxvd2luZzoKCi0gUmFmYWwgdXBkYXRlcyB0aGUgQkNNNDkwOCBEVFMgZmlsZXMgdG8gcHJvZHVj
ZSBmZXdlciB3YXJuaW5ncyBieQpmaXhpbmcgdGhlIFVBUlQgY2xvY2sgbmFtZSwgbW92aW5nIHRo
ZSByZWJvb3Qgc3lzY29uIG5vZGUgb3V0IG9mIHRoZSBidXMKbm9kZSwgYW5kIGZpbmFsbHkgdXBk
YXRpbmcgdGhlIE5BTkQgY29udHJvbGxlciBub2RlIG5hbWVzLgoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpSYWZhxYIgTWnF
gmVja2kgKDMpOgogICAgICBhcm02NDogZHRzOiBicm9hZGNvbTogYmNtNDkwODogRml4IE5BTkQg
bm9kZSBuYW1lCiAgICAgIGFybTY0OiBkdHM6IGJyb2FkY29tOiBiY200OTA4OiBNb3ZlIHJlYm9v
dCBzeXNjb24gb3V0IG9mIGJ1cwogICAgICBhcm02NDogZHRzOiBicm9hZGNvbTogYmNtNDkwODog
Rml4IFVBUlQgY2xvY2sgbmFtZQoKIGFyY2gvYXJtNjQvYm9vdC9kdHMvYnJvYWRjb20vYmNtNDkw
OC9iY200OTA4LmR0c2kgfCAxNiArKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
