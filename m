Return-Path: <SRS0=+/G9=I4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35A0C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Mar 2021 18:42:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12989619DD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Mar 2021 18:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12989619DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rlIN5sPcROMdBkZqWvRHZRlmpXappIQczouNLazVBPk=; b=Sn6bogl3BCaP0Ut7dfFB/vKg4
	65kKH0rBTMv3uCKX/tZ1peUzV91Eu/l6wWnMSGwZiNqLoY1nnJtY0novji6XuR0NZqn6xG+tRJfmn
	JS8hIaBLy2FtKrsVAM9HP7vbwmmKGUZhQq/4ufXjkGGkXkfp/Ovmw8hDAuO5vz0Q8WgkPR6vUAEES
	QcXfXuHTRE0MBjpkodfgmPbrEZ/2K6e+WhxOaGBvAznShv0KwSaYMLZkfC+CInkjpAAhw9Epjf5WT
	K3x/ixq/LWjAO0X6dwOTtDaaqzXWLJmUU8Wq/qREkSFayXRQExZ2GCsWJ2XjKazITbT42CPQ/RK1p
	atfajMuOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRJIB-004eDd-Is; Tue, 30 Mar 2021 18:40:43 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRJHm-004e9l-0u
 for linux-arm-kernel@lists.infradead.org; Tue, 30 Mar 2021 18:40:20 +0000
Received: by mail-pg1-x52a.google.com with SMTP id i6so5192698pgs.1
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 30 Mar 2021 11:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=siZMxXZOJRsfxi+OErPq5t5HqTLg1w+rpgYWkosO2js=;
 b=ZhhJni7CQt/pYsycCrqZ1AUzEk+9K34cf+Su3fHPjb2sniCX5c+UZRCnM9mpNhYIpO
 qz7fG39SxU/sRm0PqXPH7Fthd3E97DW8Kve0sZGtk+iB9JIbLzg/cBcIX7M/K979JKjn
 /dsIWjdScn5i+oANkXc4YHmU7t7SXfEM6vUUN2qDhAKVRojtapeuDOFKX99MuITejb5z
 tH5m4clVajepbeA+yR1pIKvQs0Isr72DkkynNbprBjuMzy1XT5xsXS9r9Fey2gmuWIEp
 AMsxoJpKUS5Dv4QrEANQ+ZUoLWZGeHoEWCtBZYjdTt7KDr4+60KccbE1M/9Z8JR6pRC5
 MytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=siZMxXZOJRsfxi+OErPq5t5HqTLg1w+rpgYWkosO2js=;
 b=igp6og9Lk6X8i2By1fionio3BwMClHGkxxfjMYBnodLlr8kuAeJ4Q/FLNZcWzdo3kC
 goH5UKvmGcMrn7kqI1ZYJg0K9hrQ6yCftHSkv70vIrQBHso+PdeDNiUmU4UxC5XgBhdi
 2S98CsGdLLkhDZZR1QCNhTaWGhff6oOz+ccAFgQLwIKQxvOuDhx4NFcS4dNL+GTEOyB2
 eb//FOJdjAn95h9vhhauLoBVr/k3Pu5HUo+Wps4Bvm4cAKtEaEZt6b6TBzvOMFw04kqr
 qT4/rOyp6zE1VmPkpUtbFvtCaDQjF/A/QWOHDEhdIj4tY1VKdlpRN1y7cdQha2kSt5p/
 N30Q==
X-Gm-Message-State: AOAM533yuXmHYwEfzu7iB8Ehv/s7TufHAtcbLO+brpuL7/S8563XR+Eu
 oJL7Y0ypxOns2glsls/O7bw=
X-Google-Smtp-Source: ABdhPJx9YoDb2GffSh/88l2OeS2XmU9QgOu0pnk47EXR7AaWE2yOtta7StZ12caFzb3KoEATPxrbBg==
X-Received: by 2002:a05:6a00:2163:b029:216:deaa:e386 with SMTP id
 r3-20020a056a002163b0290216deaae386mr30999519pff.72.1617129615226; 
 Tue, 30 Mar 2021 11:40:15 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id gm9sm3307696pjb.13.2021.03.30.11.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 11:40:14 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/3] Broadcom drivers changes for 5.13
Date: Tue, 30 Mar 2021 11:40:06 -0700
Message-ID: <20210330184006.1451315-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330184006.1451315-1-f.fainelli@gmail.com>
References: <20210330184006.1451315-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_194018_321517_C87BEB16 
X-CRM114-Status: GOOD (  10.30  )
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
Message-ID: <20210330184006.-kcqBn1c0X0yhe2QAsQkTce8c6vWa4C1AbPyBXWoDAU@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBmZTA3YmZkYTJmYjljZGVmOGE0ZDQw
MDhhNDA5YmIwMmYzNWYxYmQ4OgoKICBMaW51eCA1LjEyLXJjMSAoMjAyMS0wMi0yOCAxNjowNTox
OSAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRw
czovL2dpdGh1Yi5jb20vQnJvYWRjb20vc3RibGludXguZ2l0IHRhZ3MvYXJtLXNvYy9mb3ItNS4x
My9kcml2ZXJzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYmU2ZDk5NDIwMzA2YmI2
YjBhYmZmZjdhODE0NTY0YTYxNDY5MGRiNjoKCiAgc29jOiBiY206IGJjbS1wbWI6IGFkZCBCQ002
MzEzOCBTQVRBIHN1cHBvcnQgKDIwMjEtMDMtMjUgMTQ6MjQ6NDMgLTA3MDApCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClRo
aXMgcHVsbCByZXF1ZXN0IGNvbnRhaW5zIEJyb2FkY29tIEFSTS9BUk02NC9NSVBTIGJhc2VkIFNv
Q3MgZHJpdmVycwpjaGFuZ2VzIGZvciA1LjEzLCBwbGVhc2UgcHVsbCB0aGUgZm9sbG93aW5nOgoK
LSBSYWZhbCB1cGRhdGVzIHRoZSBCcm9hZGNvbSBQTUIgYmluZGluZyB0byBzdXBwb3J0IEJDTTYz
MTM4IGFuZCB1cGRhdGVzCiAgdGhlIGNvZGUgdG8gc3VwcG9ydCByZXNldHRpbmcgdGhlIDYzMTM4
IFNBVEEgY29udHJvbGxlcgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpSYWZhxYIgTWnFgmVja2kgKDIpOgogICAgICBkdC1i
aW5kaW5nczogcG93ZXI6IGJjbS1wbWI6IGFkZCBCQ002MzEzOCBiaW5kaW5nCiAgICAgIHNvYzog
YmNtOiBiY20tcG1iOiBhZGQgQkNNNjMxMzggU0FUQSBzdXBwb3J0CgogLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvcG93ZXIvYnJjbSxiY20tcG1iLnlhbWwgICAgfCAgMSArCiBkcml2ZXJzL3NvYy9i
Y20vYmNtNjN4eC9iY20tcG1iLmMgICAgICAgICAgICAgICAgICB8IDMwICsrKysrKysrKysrKysr
KysrKysrKysKIGluY2x1ZGUvZHQtYmluZGluZ3Mvc29jL2JjbS1wbWIuaCAgICAgICAgICAgICAg
ICAgIHwgIDEgKwogMyBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1h
aWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
