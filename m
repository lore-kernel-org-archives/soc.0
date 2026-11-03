Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793719472;
	b=Zh3FZhMXMcoHAA1ZOv/is6wI6Wsu1h4/3he/hyKxBqEYuWDR+89YvfmJc9tPLGH3rSwN
	 jTeNMOf9PIyGT1TPKBMMnOChCnKhAbzffnyyXxqq27Q/usLor01eOVWwSCFqbb9+IUOfL
	 k7WwBHdi/fHIdrZjh3sxsXrZ1EdDz0eJNr/T9SpExO6HZtZsZOZwnlMCz7e54FTaPR/u1
	 00kNw1VJ8csq3Xb5qndz23fj4RrOR5wNzMRdSz6oVCJpaGI/LuRfJ4TaY97H/E+/zbsCG
	 UsuMlZ4/xC2CBxnb45oWGR1ltaw8HsUvg6myWEWT9db5UDyqFdB9PddCSRLeGW7FMPw==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719472;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b1Jf7yIZNINFepAMcdlza48j9DjWumf2wWjQ6qFxRvs=;
	b=dTF7A7sahxjWo+mNIj8ELyvjVFWY+2YZDxi/FiGq9XkP3H8JdCg3x+rdXngJqlDF6fNk
	 mKYgErGX7dv9KfGkAWGUZ25BADl5NoUZp1r8gJxuIO2CAvUO4vlBsgyXfy8XbNw92HzoH
	 13onftvLBN2bjJPxaTL1IBQrRvaEBrpPsx+X63kFvhcpqfg+pf3Ipo7Z4BKkQHDp/soDn
	 Ok1OBDGYUKkNMOf/y/ljUosS+Ue8DCHLO7/imBPyCCwHKfrQIr9pyudDxKYR75DeH6EUc
	 d/4dGoc452hG59wGHPs79gi8WoPuZtwcpl5M3OtXdJJuCfw0Jm7Cn10X4KP83tuQtRg==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPcooBTx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TjSLvHFd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664EF606A78C
	for <soc@lists.linux.dev>; Tue,  3 Nov 2026 15:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPcooBTx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TjSLvHFd
Received: by smtp.kernel.org (Postfix)
	id ECEB31F00A15; Tue,  3 Nov 2026 15:24:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1793719471;
	b=DPcKkvWVzHXvydtpZPlRsQCc1HliEusWhvy2fmAgX+lCOI06QfkZUGOllZCzK8grgTon
	 TGCuMjYmQ62P54ufZjvd5ZPsLt3oZdpZOlnTsFOZ/kWNP5So9ek2cwEmxH2QkgPPpbyKu
	 i2ACDB9C5PGwtfuomcMSYNuZprzreZVhv0M1Rzv03gyOByXhRkIfmGJs11LehFiTAALBL
	 LbC0SkPMC9JpxDgiC4NJeL9mUtiClTcE64DN5jLdDPY116ULUTLJi5lxpg6MNlhGzhbeq
	 cJ5KP+URJ1wkUHTa7f3h8WcWD9t2TdNJd3EhuqF6cyPvl+N22yhrU7I8yrhTPbqQBvA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793719471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=b1Jf7yIZNINFepAMcdlza48j9DjWumf2wWjQ6qFxRvs=;
	b=cYbOJROf92JV6w3rsWdI6I12QCebQq//r1kEdlrR7Cvse14ldkdWU1i9BaLA5KrNx/Qe
	 6Ux3fzlboezzvRGag2qeKyRbS3XZUz8zRqetXgD7j8P8ER47w5hgyJrgWafBMaije30Xg
	 EqbkFRJ6paKYyjFolat4Uq+HvxNvgcW4vJB3u6D4HPSRBZE/3KzpFab6B/9Gt+qHEqZMq
	 Xtmv3N7b9uaf6c0nkNx9l9suXbrCqEEm23nl2Od/JPSB6bJgrNhpRmQlPvltF1m7aY70c
	 5l2ETvLxxmDGSTvcjSHxdUCth7J4d4ea7jt64rQm/sXLQhqzrSvzpdRi10fzHCxx8kQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPcooBTx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TjSLvHFd;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A6D31F00919
	for <soc@kernel.org>; Tue,  3 Nov 2026 15:24:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPcooBTx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TjSLvHFd
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7A6D31F00919
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9t9L2119603
	for <soc@kernel.org>; Tue, 3 Nov 2026 15:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1Jf7yIZNINFepAMcdlza48j9DjWumf2wWjQ6qFxRvs=; b=VPcooBTxCDhHNlWu
	u50nJOPgFwIwrNCdvcd9ELscXuEk47b/QKFclC9AloHhAEYldaAmoaXWT6Kyqveh
	vGC9n12OmyTXa3djbLxV8++lQTAyIr38ZLJ1SG59H6B0BjNhrezHYTYPCB+FYmPC
	DZCtDSVaWvx6zJvS+6ZbytXg5JO49rgRV77sqJqU4Vlwt5oYWap9kpKzSHKmocjE
	dAAa8F8zcTRXwd9ERQfWQ27Wde3x087FFiqF+nyu8olZeaS8DXjGiRaVrvslehkD
	Kqsng8SHDgUHmYKQPDMlzWwaRtrnZbf66KStYYnLbxzXoo0mfbR5ulNwCq5JGKp+
	e5poUA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2brbh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Tue, 03 Nov 2026 15:24:29 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67994567a44so6366729d50.0
        for <soc@kernel.org>; Tue, 03 Nov 2026 07:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793719469; cv=none;
        d=google.com; s=arc-20260327;
        b=UuLT5ggmH4bM7bG73ILzI1XkIsMGeZHaP5Pv/3TB1Hf/ycjUwYOk/JxjJm1itLBCn/
         K3gS5PKN+JcEkDaGwP3xR99BHPdmeQvIbcegEaEMY4hgJzLi4M9wBdkLwrjGTXTJy4dR
         GcIF8XfjA3egCITM9tn9qhrynVYUJd5n63Nxq99lzJEjmLwjIW/lztHgc77SJvdhhrs5
         8IYbfLAe4YobfYwgTa0IEn5zKRTAXtQPAi/1EPdqIKjQauKQPGpQG3w+/hfYXcmqQAi0
         UKiiSNwFrJqnPYooTTVhGvXCZL808Ghzb+lEZ4a+JuorvFM3thJNQJKQQ3UQF4fsK6eg
         RXww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b1Jf7yIZNINFepAMcdlza48j9DjWumf2wWjQ6qFxRvs=;
        fh=FGH+CMRInPn/pA+vDEDjLA4SUUyPg10jKFjWDfKdq+E=;
        b=JxKiBm4LTTw1Pxk8WYjBrHIDv0/glsEeX9H9koyoFz1iKVg0Zj+wUq4gpHahXSWww+
         QnO0W1XfRcG/cyY/iiSJxkwbWOO40T1lp0x25FRYN+g4U3qheRayKJNzXC00cF8ZA7u8
         uVCoRpMB0y0O2VfBxA8ccr7QRLUlA1eZlQlGuxaiFoaxHICR2mlRpsiijTsUvqVBtSTC
         L+E/XeeRT801uXexwLw8L+LnVR4osHmbbH+uOJTTOi+NhbZtdLQp2DfKw3LiEsjs/+hM
         QBS16uxyiK9BPoOsPho6aLSws/ys2EkTgOAVSv4+o2zn+Y0a6Tc+455ubRu7bDko98hq
         u6Ug==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793719469; x=1794324269; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b1Jf7yIZNINFepAMcdlza48j9DjWumf2wWjQ6qFxRvs=;
        b=TjSLvHFd1vTH/MQsrk8UES7JE5FiSm5S6sgb3Cjt0dECqKyJYmE4uvuAPCpw5fuC7O
         rlVQiD9IstjSSomnjyIJudP7vRExvReN8B/OVT2pNLk9z0/ONaQO45QJT/22gY14fN5T
         8YOU5sbJukqsxha/5ro3BcRANqr0Fha//FWRcEmCCVBjn9hDRwyyjpeQNRt7D2ZmTsCE
         PJrzwnBUnjrxa/XTL1tI3Lvx6nMvp9eYQtbpvzdKun4kVH9yfiaDY5qTx9Yr39SdgLte
         89beXfVPB7uvTDqUPTQTQwu8J3n40fq2umBl1x/8hntfA3kxBgPBU/AE3aiMWx1mPKzl
         2Ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719469; x=1794324269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1Jf7yIZNINFepAMcdlza48j9DjWumf2wWjQ6qFxRvs=;
        b=B51cttDUKeCzYQu4ZlwD7DpBewEbvIIkwyFAE5xp63Zkgwp++rcm5zSFP1u6FFTgx6
         uHVc4LwU1QNzOciFCQxfHV56Hege+UDa7Ack69nCqj8mYO9e2P1nci6CzDfXjT1CLt13
         z2CLSBnVd5VWNJp5pTCbiRCFdS4aZvv0U2blqWqo4SBnHp+IBMEO/bjlASGtS+rxy8sM
         Vo352VwfPV/sFh13pA0EV8v3yUhPziT0eZsc4VRRe2ODY8V9pZIsDmK5vTAyhWuIkHAw
         7UjhYJezetYurlG9oWpmvKf0ko7lKLPbgN1OaUkfqqHbyaFxX/8kS6O6g8XzM0A8CwcQ
         bkRw==
X-Forwarded-Encrypted: i=1; AKwUvBwz5+aa3m3eaXEf4NVT0UBKKw9qSja5tKc06zJbQ4XFi7nIBfD4N2tZ1AB4ZFwh+a0RIA4=@kernel.org
X-Gm-Message-State: APuU4Z8/CVkccRwQuDTRacSnxFwWPt9Fzlthw6EeFM+0wB/tAc41Qy2z
	74wJC1OQ3E6DsjAG1Dxbz4UQpAvxGbdneJO6sboNkxhepogkf/xS96rNrukWjprcPZkObh6P+bO
	0sw2Li7KxoRSX9JuN9R5PXD333HCNk8Tlx019gXmN0Jbo5T/3dk7zthDlCffyy144YUGlLhuA3W
	F6DeXKNq5cWYs6eqGQ37zxJS0=
X-Gm-Gg: AYBFou2CTfCH0uJb5hqE2dOWXGegKEEnuwkrr4kzwng4mrosNIeGgOrc6dlZfKR3EkL
	GyZi0JWDqfwaj/lXf6mWKvA97lsUG7HxvXznmZW7NMkjaB8nnB75ETX+jssmyhJ6Qq232rmRLs9
	o5kHpJezN1lJqTxRF2JpeRWwq94adGJeTy5+TjiIay5Kvt8bH6t5P7vwa/Qvs93tAFTn2tHpG42
	yhn/rw2XEUxbaqJAPWXIal5Rb5/OCl+JGpAgJIR
X-Received: by 2002:a05:690e:138e:b0:67b:abb9:3d15 with SMTP id 956f58d0204a3-67babb948e3mr8554282d50.24.1793719468625;
        Tue, 03 Nov 2026 07:24:28 -0800 (PST)
X-Received: by 2002:a05:690e:138e:b0:67b:abb9:3d15 with SMTP id
 956f58d0204a3-67babb948e3mr8554263d50.24.1793719468109; Tue, 03 Nov 2026
 07:24:28 -0800 (PST)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261002145140.GA784348@rayden> <522a2d28-2ac9-4a56-8a61-477be3dfbbd9@app.fastmail.com>
 <CAGgiveUDQvqpJKo4XuboP_46t7DPSBT1jdaTafROvobk2V5mwQ@mail.gmail.com>
In-Reply-To: <CAGgiveUDQvqpJKo4XuboP_46t7DPSBT1jdaTafROvobk2V5mwQ@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:24:17 +0100
X-Gm-Features: AclHuK_7QkcnsqO7rpddbyxmd5bsrxtK9QzYCDAUOQsSq6QU6rohTZ3Vg-dyLMA
Message-ID: <CAGgiveWadMfHBMu=vSeqwgoz8rcXXg4E9OrAKnkWPPFn07pimw@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE update for v7.4
To: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MSBTYWx0ZWRfX45iimbruBxFE
 bxyhIoJ4jo8kDFDjjCQbMf53xvMOx4+WXEd6auPGsNS5X2vBLUaw3bwQF7tvx/FYGSxSfUPFmCi
 F1h6jg8zV8f1deioW5IlTN/SEIsu2F0=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6ae9fcad cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=h2ZEknDc1N0j5eo6QzAA:9
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: 9AA2kMi6ifn-anMwWi2kWu5Fzr_b8tBY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MSBTYWx0ZWRfXyJQfeyUn3m2X
 Kx5eZ6Apk950jepyotFZb6lXcHZRrf6GrpinSceqFTQ7TvA06a7r7JoLPQm5MHus71Q0sUTiTCW
 EhPpxWvNH4+YYwIoga21ZkvwCeDtUMhK23D4778fq44L7/Zpbbg01NX9BULyOcIjT98K0yNErWk
 YF0f4B8BfXRK7bbc20DJGssY1JkNdCKeyVtAvduHoV/qdH3x8RhfLjgINIYjfreVYYAFXQlrNow
 BaHodzXun6s8GXuV4p152vFnmLKE7HVOe14udF5+fBwQL+GxGJl3rMCfYWmOawVysP+Koc610MR
 2C7op/NNK/yU3kkocrmbX3qS0pSYeijdkxl0b8i0tBpBuxxTWGIe6TabBqe6d/pzNaD8psqjh1k
 f0k+oo6rPh5dCZP0aOnWAuZyBwgHKHnpktdBVgFzOt2F1sVYeF04MqWvTEWDWPyimdqph0N9Lxg
 XspMt0j7rHlcxo/S2Og==
X-Proofpoint-GUID: 9AA2kMi6ifn-anMwWi2kWu5Fzr_b8tBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030061

Hi Marouene,

Can you make a v5 of "[PATCH v4] tee: optee: build the Arm-specific
code only on Arm" addressing Arnd's comments, please? That is,
replacing IS_REACHABLE() with IS_ENABLED() in the patch. As Arnd
points out, with  OPTEE depending on ARM_FFA_TRANSPORT ||
!ARM_FFA_TRANSPORT, the code is always reachable if enabled.

Thanks,
Jens

On Wed, Oct 14, 2026 at 8:34=E2=80=AFAM Jens Wiklander
<jens.wiklander@oss.qualcomm.com> wrote:
>
> Hi Arnd,
>
> On Tue, Oct 13, 2026 at 4:53=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wro=
te:
> >
> > On Fri, Oct 2, 2026, at 16:51, Jens Wiklander wrote:
> > > for you to fetch changes up to ccd4b23398acaf2139cf04f1ba0a66150cbf26=
63:
> > >
> > >   tee: optee: build the Arm-specific code only on Arm (2026-10-02
> > > 16:28:41 +0200)
> > >
> > > ----------------------------------------------------------------
> > > Build the OP-TEE driver's SMC and FF-A code only where supported
> > >
> > > ----------------------------------------------------------------
> > > Marouene Boubakri (1):
> > >       tee: optee: build the Arm-specific code only on Arm
> >
> > I had a look at the contents and saw that it keeps the
> > IS_REACHABLE() checks that are notoriously error-prone.
> > E.g. this part just looks broken:
> >
> > @@ -257,8 +266,12 @@ struct optee {
> >         const struct optee_ops *ops;
> >         struct tee_context *ctx;
> >         union {
> > +#ifdef CONFIG_HAVE_ARM_SMCCC
> >                 struct optee_smc smc;
> > +#endif
> > +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
> >                 struct optee_ffa ffa;
> > +#endif
> >         };
> >         struct optee_shm_arg_cache shm_arg_cache;
> >         struct optee_call_queue call_queue;
> >
> > The presence of the 'ffa' member in the union is conditional
> > on whether the driver that includes the header is a loadable
> > module or built-in, and this changes the entire structure
> > layout if both types of users are present.
> >
> > The intention of the patch does make a lot of sense,
> > but as far as I can tell, only the Kconfig change is
> > actually required, while the added preprocessor checks
> > only make it harder to read and it should have been
> > sufficient to change the existing IS_REACHABLE() to
> > IS_ENABLED() for consistency.
> >
> > Sorry I did not notice this one earlier as I was travelling,
> > but I think I can't pull this version, please respin.
>
> Thanks for catching this. We'll repin.
>
> Cheers,
> Jens
